Feature: Encontrar um usuario
    Como um usuario da CrudAPI 
    Desejo consultar um novo usuario criado
Background:
* def jsonrequestcriar =
    """
    {
       "name":"Lula Livre121313",
        "email":"lula1312312@pt.com.br"
    }
    """
    Scenario: Buscar um usuario criado por id
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
           And path "users"
           Given request jsonrequestcriar
           When method post
           Then status 201
           * def id = response.id 
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users", id
        When method get
        Then status 200
        And match response == "#object"
        And match response contains jsonrequestcriar
        And match response[*].tags[*].id =="#present"
        And match response[*].tags[*].createdAt =="#present"
        And match response[*].tags[*].updatedAt =="#present"
        And path "users", id
        When method delete
        Then status 204
    