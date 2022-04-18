Feature: Encontrar um usuario
    Como um usuario da CrudAPI 
    Desejo consultar um novo usuario criado

    Scenario: Buscar um usuario criado
    * def id = "c55b3de0-0ca2-431f-9226-6a9cc33f64b9"
     * def jsonrequest =
    """
    {"id":"c55b3de0-0ca2-431f-9226-6a9cc33f64b9","name":"jKvarDYlmg","email":"jKvarDYlmg@raroacademy.com"}
    """
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
    And path "users", id
    When method get
    Then status 200
    And match response == "#object"
    And match response contains jsonrequest
    And match response[*].tags[*].createdAt =="#present"
    And match response[*].tags[*].updatedAt =="#present"

    