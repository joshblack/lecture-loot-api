<?php


echo urlencode(json_encode("bob78964"));


?>

<form action="v1/register" method="post">
    

username: <input type="text" name="USER_NAME"><br>
password: <input type="text" name="USER_PASSWORD"><br>
email	: <input type="text" name="USER_EMAIL"><br>
first	: <input type="text" name="USER_FIRST_NAME"><br>
last	: <input type="text" name="USER_LAST_NAME"><br>
api		: <input type="text" name="USER_API_KEY"><br>
<input type="submit" name="submit" />
</form>