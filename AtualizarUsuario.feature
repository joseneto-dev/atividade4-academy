Feature: Atualizar um usuario
    Como um usuario da CrudAPI 
    Desejo atualizar informações um usuario criado

    Scenario: Atualizar as informacoes de um usuario
        * def id = "440231a9-1f22-4679-9d53-2966d9ecb392"
        * def jsonrequest =
          """
         {
            "name":"José112",
            "email":"jose112@raro.com.br"
         }
         """
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users", id
        Given request jsonrequest
        When method put
        Then status 200
        And match response == "#object"
        And match response contains jsonrequest