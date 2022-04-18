Feature: Encontrar um usuario
    Como um usuario da CrudAPI 
    Desejo consultar um novo usuario criado

    Scenario: Buscar um usuario criado por id
    * def id = "b1f4f71a-837e-4e07-a11c-20765874ec4b"
    * def jsonrequest =
    """
    {"id":"b1f4f71a-837e-4e07-a11c-20765874ec4b","name":"JCAjjUSFvt","email":"JCAjjUSFvt@raroacademy.com"}
    """
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users", id
        When method get
        Then status 200
        And match response == "#object"
        And match response contains jsonrequest
        And match response[*].tags[*].id =="#present"
        And match response[*].tags[*].createdAt =="#present"
        And match response[*].tags[*].updatedAt =="#present"

    