Feature: Listar usuarios 
    Como um usuario da CrudAPI 
    Desejo ver todos os usuarios
    Para ter uma visão geral dos cadastros

    Scenario: Listar todos os usuarios
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        When method get
        Then status 200
        And match response == "#array"
        And match response[*].tags[*].name == "#present"
        And match response[*].tags[*].email == "#present"
        And match response[*].tags[*].id == "#present"
        And match response[*].tags[*].createdAt =="#present"
        And match response[*].tags[*].updatedAt =="#present"