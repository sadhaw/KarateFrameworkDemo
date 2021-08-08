# Author: praneeth
Feature: Test End points of user realted (CRUD)

  Background: 
    * url 'https://reqres.in'
    * header Conten-Type = 'application/json'
    * def expectedOutput = read ('Data/userresult.json')
    * def requestbody = read ('Data/Userload.json')

  # In most cases you won't need to set the Content-Type header in your script as Karate will automatically do it according to the data-type of the request.
  Scenario: Testing the  GET all customers and then get the first customer by id
    Given path  '/api/users'
    When method GET
    Then status 200
    Then print response
    And match response == expectedOutput [0]

  Scenario: Testing the POST call with request body as json file
    Given path 'api/users'
    And request requestbody
    When method POST
    Then status 201
    Then print 'response---1',response

  Scenario: Verify that the user information is successfully updated
    Given path 'api/users/2'
    When request { "email": "jane.weav11r@yahoo.in", "first_name": "Jagnet", "last_name": "Weavge" }
    And method PUT
    Then status 200
    And print 'Response is: ', response
    And match response == {"email": "jane.weav11r@yahoo.in", "first_name": "Jagnet", "last_name": "Weavge","updatedAt":'#notnull'}
    Then assert responseStatus == 200 || responseStatus == 204

  Scenario: Verify that the existing employee is successfully getting deleted
    Given  path 'api/users/8'
    And method delete
    Then status 204
    And print 'Response is: ', response
