Feature: Cadastrar um novo usario 
    Como um usuario da CrudAPI 
    Desejo cadastrar um novo usuario

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

 * def jsonrequest =
    """
    {
   
    }
    """
   * jsonrequest.name = randomString 
   * jsonrequest.email = randomString + "@raroacademy.com"
   
    Scenario: Cadastrar um novo usuario
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
    And path "users"
    Given request jsonrequest
    When method post
    Then status 201
    And match response == "#object"
    And match response contains jsonrequest
     And match response[*].tags[*].createdAt =="#present"
    And match response[*].tags[*].updatedAt =="#present"