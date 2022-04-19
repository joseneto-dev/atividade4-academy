Feature: Listar usuarios 
    Como um usuario da CrudAPI 
    Desejo ver todos os usuarios
    Para ter uma visão geral dos cadastros

Background:
* def jsonrequestcriar =
    """
    {
        "name":"Lula Livre131312",
        "email":"lula131133@pt.com.br"
    }
    """
    Scenario: Listar todos os usuarios

        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        Given request jsonrequestcriar
        When method post
        Then status 201
        * def id = response.id 
        And path "users", id
        When method delete
        Then status 204
        And path "users"
        When method get
        Then status 200
        And match response == "#array"
        And match response[*].tags[*].name == "#present"
        And match response[*].tags[*].email == "#present"
        And match response[*].tags[*].id == "#present"
        And match response[*].tags[*].createdAt =="#present"
        And match response[*].tags[*].updatedAt =="#present"