Feature: Atualizar um usuario
    Como um usuario da CrudAPI 
    Desejo atualizar informações um usuario criado

    Scenario: Atualizar as informacoes de um usuario
        * def id = "bd3fb2b6-87e8-40d9-a85a-94e7be6bbf2b"
        * def jsonrequest =
          """
         {
            "name":"José1",
            "email":"jose1@raro.com.br"
         }
         """
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users", id
        Given request jsonrequest
        When method put
        Then status 200
        And match response == "#object"