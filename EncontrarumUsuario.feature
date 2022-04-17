Feature: Encontrar um usuario
    Como um usuario da CrudAPI 
    Desejo consultar um novo usuario criado

    Scenario: Buscar um usuario criado
    * def id = "bd3fb2b6-87e8-40d9-a85a-94e7be6bbf2b"
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
    And path "users", id
    When method get
    Then status 200
    And match response == "#object"