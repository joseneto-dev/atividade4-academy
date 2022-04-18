Feature: Atualizar um usuario
    Como um usuario da CrudAPI 
    Desejo atualizar informações um usuario criado

Background:
* def id = "c55b3de0-0ca2-431f-9226-6a9cc33f64b9"
* def jsonrequest =
          """
         {
           "name": "José Duarte",
           "email": "jose@raroacademy.com"
         }
         """
    Scenario: Atualizar as informacoes de um usuario
        
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
            And path "users", id
            Given request jsonrequest
            When method put
            Then status 200
            And match response == "#object"
            And match response contains jsonrequest
            And match response[*].tags[*].createdAt =="#present"
            And match response[*].tags[*].updatedAt =="#present"