Feature: Fazer a busca pelo email ou nome
    Como um usuario da CrudAPI 
    Desejo consultar um usuario criado

    Scenario: Buscar um usuario pelo nome
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "search"
        And param value = "xIDOBNvOQG"
        When method get
        Then status 200
        And match response == "#array"

    Scenario: Buscar um usuario pelo email
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "search"
        And param value = "xIDOBNvOQG@raroacademy.com"
        When method get
        Then status 200
        And match response == "#array"