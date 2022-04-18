Feature: Atualizar um usuario
    Como um usuario da CrudAPI 
    Desejo atualizar informações um usuario criado

Background:
* def id = "02e1d912-e5ae-45aa-838a-10ee288720a2"
* def jsonrequest =
          """
         {
           "name": "José Duarte",
           "email": "jose@raroacademy.com"
         }
         """
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
* def randomStringgrande = random_String(101)
* def randomStringemail = random_String(61)
* def jsonrequesterrado =
    """
    {
        "nome":"jose",
        "email":"jose"
    }
    """ 
* def jsonrequestincorreto =
    """
    {
        "name":"xIDOBNvOQG111",
        "email":"xIDOBNvOQG111@raroacademy.com"
    }
    """ 
* def jsonrequestgrande =
    """
    {
   
    }
    """
* def jsonrequestsemnome =
    """
    {
   
    }
    """
* def jsonrequestemailusado =
    """
    {
        "name":"Jose Novo 1112",
        "email":"xIDOBNvOQG@raroacademy.com"
    }
    """
   * jsonrequestgrande.name = randomStringgrande 
   * jsonrequestgrande.email = randomStringemail + "@raroacademy.com"

    Scenario: Atualizar as informacoes de um usuario
        
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
            And path "users", id
            Given request jsonrequest
            When method put
            Then status 200
            And match response == "#object"
            And match response contains jsonrequest
            And match response[*].tags[*].id =="#present"
            And match response[*].tags[*].createdAt =="#present"
            And match response[*].tags[*].updatedAt =="#present"
    Scenario: Atualizar as informacoes de um usuario com email incorreto
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users",id
        Given request jsonrequesterrado
        When method put
        Then status 400

    Scenario: Atualizar as informacoes de um usuario com email já criado
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users",id
        Given request jsonrequestincorreto
        When method put
        Then status 422

    Scenario: Atualizar as informacoes de um usuario com email com mais de caracteres
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users",id
        Given request jsonrequestgrande
        When method put
        Then status 400

Scenario: Atualizar as informacoes de um usuario sem nome e email
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users",id
        Given request jsonrequestsemnome
        When method put
        Then status 400

Scenario: Atualizar as informacoes de um usuario com email já utilizado
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users",id
        Given request jsonrequestemailusado
        When method put
        Then status 422

