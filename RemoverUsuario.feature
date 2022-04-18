Feature: Remover um usuario
    Como um usuario da CrudAPI 
    Desejo remover informações um novo usuario criado

    Scenario: Remover um usuario
         * def id = "1785fbf5-d99e-4ad3-918d-29bbad0bbd94"
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users", id
        When method delete
        Then status 204