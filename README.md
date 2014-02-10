lecture-loot-api
================

PHP API for school project

- Send the proper HTTP request to the appropriate API path "api/v1/{request call}"
  * Everything should be json encoded first and then urlencoded
    * api_v1
      * POST /register
        * username
        * password
        * email
        * first name
        * last name
        * ->return api key as a json object
        * creates entry in points table with initial quantity of 100 points
      * GET /points/{username}/{api-key}
        * ->returns the number of points the user has as a json object
      * GET /course/{course-number}/{api-key}
        * ->returns all of the matches from the courses table as a json object
      * GET /schedule/read/{user]/{api-key}
        * ->returns all of the classes the user is registered for as a json object
      * GET /building/{building}/{api-key}
        * ->returns all of the building matches from the buildins table as a json object
