Feature: Fazer a busca pelo email ou nome
    Como um usuario da CrudAPI 
    Desejo consultar um usuario criado

    Scenario: Buscar um usuario
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        And form field value = "José"
        When method get
        Then status 200
        And match response == "#array"