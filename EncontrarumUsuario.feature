Feature: Encontrar um usuario
    Como um usuario da CrudAPI 
    Desejo consultar um novo usuario criado

    Scenario: Buscar um usuario criado
    * def id = "382536e4-a178-4e0f-bbb1-b9437200eeb0"
     * def jsonrequest =
    """
    {"id":"382536e4-a178-4e0f-bbb1-b9437200eeb0","email":"KEbCJDxOFu@raroacademy.com","name":"KEbCJDxOFu"}
    """
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
    And path "users", id
    When method get
    Then status 200
    And match response == "#object"
    And match response contains jsonrequest
    And match response[*].tags[*].createdAt =="#present"
    And match response[*].tags[*].updatedAt =="#present"

    