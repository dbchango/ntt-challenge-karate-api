Feature: User CRUD

  Background:
    * url 'https://petstore.swagger.io/v2/user'
    * def user =
      """
      [{
          "id" : 100,
          "username": "dchango",
          "firstName": "David",
          "lastName": "Chango",
          "email": "dchango@gmail.com",
          "password": "password",
          "phone": "099912134",
          "userStatus": 0
       }]
      """
    * def new_user =
      """
      {
        "firstName": "Bernardo",
        "email": "dchango@outlook.es"
      }
      """
  Scenario: crate a user
    Given path 'createWithArray'
    And request user
    And header Accept = 'application/json'
    When method post
    Then status 200

  Scenario: find created user
    Given path user[0].username
    And header Accept = 'application/json'
    When method get
    Then status 200

  Scenario: update name and email
    Given path user[0].username
    And request new_user
    And header Accept = 'application/json'
    When method put
    Then status 200

  Scenario: find updated user
    Given path user[0].username
    And header Accept = 'application/json'
    When method get
    Then status 200
    * print 'updated user name is: ', new_user.firstName
    * print 'updated user email is: ', new_user.email

  Scenario: delete user
    Given path user[0].username
    When method delete
    Then status 200