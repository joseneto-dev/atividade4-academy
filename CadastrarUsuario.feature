Feature: Cadastrar um novo usario 
    Como um usuario da CrudAPI 
    Desejo cadastrar um novo usuario

    Scenario: Cadastrar um novo usuario
    * def jsonrequest =
    """
    {
        "name":"José1111",
        "email":"jose1111@raro.com.br"
    }
    """
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
    And path "users"
    Given request jsonrequest
    When method post
    Then status 201
    And match response == "#object"
    And match response contains jsonrequest