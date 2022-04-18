Feature: Atualizar um usuario
    Como um usuario da CrudAPI 
    Desejo atualizar informações um usuario criado

Background: 
* def random_String = 
"""
    function(s){
        var text = "";
        var pattern="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        for(var i=0;i<s;i++)
            text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
            return text;
    }
"""
* def randomString = random_String(10)

* def id = "382536e4-a178-4e0f-bbb1-b9437200eeb0"
        * def jsonrequest =
          """
         {
           
         }
         """
            * jsonrequest.name = randomString 
            * jsonrequest.email = randomString + "@raroacademy.com"
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