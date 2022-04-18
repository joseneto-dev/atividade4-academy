Feature: Atualizar um usuario
    Como um usuario da CrudAPI 
    Desejo atualizar informações um usuario criado

Background:
* def id = "b1f4f71a-837e-4e07-a11c-20765874ec4b"
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