<?php

require_once __DIR__.'/vendor/autoload.php';

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

$app = new Silex\Application();

$app['debug'] = true;

/**
* 
*/
class Protection
{
	public static function hashpw($username, $password) {
		$salt = hash('sha256', uniqid(mt_rand(), true) . 'baconstrips' . strtolower($username));
		$hash = $salt . $password;
		for ($i = 0; $i < 10; $i++) {
			$hash = hash('sha256', $hash);
		}
		return $salt . $hash;
	}

	public static function check($password, $username, $app) {
		$sql = "SELECT * FROM users WHERE `USER_NAME` = ?";
		$stmt = $app['db'] -> prepare($sql);
		$stmt -> bindValue(1, $username);
		$stmt -> execute();
		$rows = $stmt -> fetch();
		$salt = substr($rows['USER_PASS'], 0, 64);
		$hash = $salt . $password;
		for ($i = 0; $i < 10; $i++) {
			$hash = hash('sha256', $hash);
		}
		$hash = $salt . $hash;
		return ($hash === $rows['USER_PASS']) ? $rows : -1;
	}

	public static function auth($app, $value = array())	{
		$sql = "SELECT * FROM users WHERE `USER_API_KEY` = ?";
		$stmt = $app['db'] -> prepare($sql);
		$stmt -> bindValue(1, $value[0]);
		$stmt -> execute();
		$rows = $stmt -> fetch();

		if(empty($rows))
			return false;
		else
			return true;
	}

	public static function logcall($app, $value = array())	{
		$sql = "INSERT INTO log VALUES (DEFAULT, ?, ?, ?)";
		$stmt = $app['db'] -> prepare($sql);

		$stmt -> bindValue(1, $value['key']);
		$stmt -> bindValue(2, null);
		$stmt -> bindValue(3, json_encode($value));
		$stmt -> execute();
	}

	public static function parse($value)
	{
		return (json_decode(urldecode($value)));
	}
}

$app->register(new Silex\Provider\DoctrineServiceProvider(), array('db.options' => array('driver' => 'pdo_mysql', 
	'host' => 'localhost', 'dbname' => 'lectureloot', 'user' => 'root', 'password' => '', 'charset' => 'utf8')));

$app->get('/hello', function() use ($app){
	return json_encode('Hello!');
});

$app->post('/register', function(Request $request) use ($app) {
	try {
		$username = $request -> get('USER_NAME');
		$password = $request -> get('USER_PASSWORD');

		$sql = "SELECT * FROM users WHERE `USER_NAME` = ?";
		$stmt = $app['db'] -> prepare($sql);
		$stmt -> bindValue(1, $username);
		$stmt -> execute();
		$rows = $stmt -> fetch();

		$params = $request -> request -> all();
		array_pop($params);
		print_r($params);

		if(empty($rows))		{
			$pass = Protection::hashpw($username, $password);
			$key = Protection::hashpw($username, $password);

			$sql = "INSERT INTO users VALUES (?, ?, ?, ?, ?, ?, ?, 1)";
			$stmt = $app['db'] -> prepare($sql);
			$stmt -> bindValue(1, null);
			$stmt -> bindValue(2, $params['USER_NAME']);
			$stmt -> bindValue(3, $pass);
			$stmt -> bindValue(4, $key);
			$stmt -> bindValue(5, $params['USER_EMAIL']);
			$stmt -> bindValue(6, $params['USER_FIRST_NAME']);
			$stmt -> bindValue(7, $params['USER_LAST_NAME']);
			$stmt -> execute();

			$sql = "SELECT * FROM users WHERE `USER_NAME` = ?";
			$stmt = $app['db'] -> prepare($sql);
			$stmt -> bindValue(1, $username);
			$stmt -> execute();
			$rows = $stmt -> fetch();

			$sql = "INSERT INTO user_points VALUES (?, 100)";
			$stmt = $app['db'] -> prepare($sql);
			$stmt -> bindValue(1, $rows['USER_ID']);
			$stmt -> execute();

			Protection::logcall($app, array("call" => "register" , "key" => $key));

			return json_encode(array($key));
		}
		else
			return json_encode(array('username exists'));
	} catch (Exception $e) {
		return ('false: ' . $e -> getMessage());
	}
});

$app->get('/points/{user}/{key}', function($user, $key) use ($app){

	try {

		if(Protection::auth($app, array($key)))		{
			$user = Protection::parse($user);
			$sql = "SELECT USER_POINTS_TOTAL FROM users, user_points WHERE `USER_NAME` = ? AND `USER_ID` = `USER_POINTS_ID`";
			$stmt = $app['db'] -> prepare($sql);
			$stmt -> bindValue(1, $user);
			$stmt -> execute();
			$rows = $stmt -> fetch();

			Protection::logcall($app, array("call" => "points" , "key" => $key));

			return json_encode(array($rows));
		}
		else
			return json_encode("user not found");
	} catch (Exception $e) {
		return ('false: ' . $e -> getMessage());
	}
});

$app->get('/course/{course}/{key}', function($course, $key) use ($app){

	try {
		if (Protection::auth($app, array($key))) {
			$course = Protection::parse($course);

			$course = str_split($course);
			$course = implode('%', $course);
			$course = '%'.$course.'%';
			$sql = "SELECT * FROM courses WHERE `COURSE_DEPT_CODE` LIKE ?";
			$stmt = $app['db'] -> prepare($sql);
			$stmt -> bindValue(1, $course);
		
			$stmt -> execute();
			$rows = $stmt -> fetchAll();

			Protection::logcall($app, array("call" => "course_search", "param" => $course, "key" => $key));

			if(empty($rows)){
				$rows = json_encode("No course found");
			}

			return json_encode($rows);
		}
		else {
			return json_encode("No course found");
		}
	} catch (Exception $e) {
		return ('false: ' . $e -> getMessage());
	}
});

$app->get('/schedule/read/{user}/{key}', function($user, $key) use ($app){

	try {
		if (Protection::auth($app, array($key))){
			$user = Protection::parse($user);
			$sql = "SELECT courses.* FROM registrations, users, courses WHERE `USER_NAME` = ? AND `USER_ID` = `REGISTRATION_USER` 
				AND `REGISTRATION_COURSE_DEPT` = `COURSE_DEPT_CODE` AND `REGISTRATION_COURSE_SECTION` = `COURSE_SECTION`";
			$stmt = $app['db'] -> prepare($sql);
			$stmt -> bindValue(1, $user);
			$stmt -> execute();
			$rows = $stmt -> fetchAll();

			Protection::logcall($app, array("call" => "display_schedule", "key" => $key));

			return json_encode($rows);
		}
		else {
			return json_encode("No schedule");
		}
	} catch (Exception $e) {
		return ('false: ' . $e -> getMessage());
	}

});

$app->get('/building/{building}/{key}', function($building, $key) use ($app){

	try {
		if(Protection::auth($app, array($key))){
			//$building = Protection::parse($building);

			$building = str_split($building);
			$building = implode('%', $building);
			$building = '%'.$building.'%';
			$sql = "SELECT * FROM buildings WHERE `BUILDING_CODE` LIKE ?";
			$stmt = $app['db'] -> prepare($sql);
			$stmt -> bindValue(1, $building);
			$stmt -> execute();
			$rows = $stmt -> fetchAll();

			Protection::logcall($app, array("call" => "building_search", "param" => $building, "key" => $key));

			return json_encode($rows);
		}
	} catch (Exception $e) {
		return ('false: ' . $e -> getMessage());
	}

});

$app->run();

