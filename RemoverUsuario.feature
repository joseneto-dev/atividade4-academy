Feature: Remover um usuario
    Como um usuario da CrudAPI 
    Desejo remover informações um novo usuario criado
Background:
* def jsonrequestcriar =
    """
    {
        "name":"Lula Livre",
        "email":"lula13@pt.com.br"
    }
    """
    Scenario: Remover um usuario
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        Given request jsonrequestcriar
        When method post
        Then status 201
        * def id = response.id 
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users", id
        When method delete
        Then status 204