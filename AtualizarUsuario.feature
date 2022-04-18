Feature: Atualizar um usuario
    Como um usuario da CrudAPI 
    Desejo atualizar informações um usuario criado

Background:
* def id = "eac814be-3cd0-485d-9af8-f2b46dae74e8"
* def jsonrequest =
          """
         {
           "name": "José Duarte'11",
           "email": "jose1'1'1@raroacademy.com"
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
* def randomStringgrande = random_String(121)
* def randomStringemail = random_String(71)
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
        "name":"Aluno Academy",
        "email":"aluno@email.com"
    }
    """ 
* def jsonrequestgrandenome =
    """
    {
     "email":"aluno222@email.com"
    }
    """
* def jsonrequestgrande =
    """
    {
    "name":"Aluno Academy Novo",
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
        "name":"Aluno Academy Novo",
        "email":"aluno@email.com"
    }
    """
   * jsonrequestgrandenome.name = randomStringgrande
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

    Scenario: Cadastrar um novo usuario com nome com mais de 100 caracteres
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users",id
        Given request jsonrequestgrandenome
        When method post
        Then status 404

    Scenario: Cadastrar um novo usuario com email com mais de 60 caracteres
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users",id
        Given request jsonrequestgrande
        When method post
        Then status 404

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

