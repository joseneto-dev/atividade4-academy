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
* def randomStringgrande = random_String(101)
* def randomStringemail = random_String(61)

* def jsonrequest =
    """
    {
   
    }
    """
   * jsonrequest.name = randomString 
   * jsonrequest.email = randomString + "@raroacademy.com"
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
        "name":"xIDOBNvOQG",
        "email":"xIDOBNvOQG@raroacademy.com"
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
    Scenario: Cadastrar um novo usuario
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        Given request jsonrequest
        When method post
        Then status 201
        And match response == "#object"
        And match response contains jsonrequest
        And match response[*].tags[*].id =="#present"
        And match response[*].tags[*].createdAt =="#present"
        And match response[*].tags[*].updatedAt =="#present"

    Scenario: Cadastrar um novo usuario com email incorreto
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        Given request jsonrequesterrado
        When method post
        Then status 400

    Scenario: Cadastrar um novo usuario com email já criado
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        Given request jsonrequestincorreto
        When method post
        Then status 422

    Scenario: Cadastrar um novo usuario com email com mais de caracteres
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        Given request jsonrequestgrande
        When method post
        Then status 400

Scenario: Cadastrar um novo usuario sem nome e email
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        Given request jsonrequestsemnome
        When method post
        Then status 400

Scenario: Cadastrar um novo usuario com email já utilizado
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        Given request jsonrequestemailusado
        When method post
        Then status 422

