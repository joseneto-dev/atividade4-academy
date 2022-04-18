Feature: Encontrar um usuario
    Como um usuario da CrudAPI 
    Desejo consultar um novo usuario criado

    Scenario: Buscar um usuario criado por id
    * def id = "1785fbf5-d99e-4ad3-918d-29bbad0bbd94"
    * def jsonrequest =
    """
    {"id":"1785fbf5-d99e-4ad3-918d-29bbad0bbd94","name":"GjWrvkkxzQ","email":"GjWrvkkxzQ@raroacademy.com"}
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

    