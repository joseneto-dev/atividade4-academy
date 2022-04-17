Feature: Encontrar um usuario
    Como um usuario da CrudAPI 
    Desejo consultar um novo usuario criado

    Scenario: Buscar um usuario criado
    * def id = "440231a9-1f22-4679-9d53-2966d9ecb392"
     * def jsonrequest =
    """
    {"id":"440231a9-1f22-4679-9d53-2966d9ecb392","name":"José11","email":"jose11@raro.com.br","updatedAt":"2022-04-17T20:31:55.273Z","createdAt":"2022-04-17T20:31:55.273Z"}
    """
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
    And path "users", id
    When method get
    Then status 200
    And match response == "#object"
    And match response contains jsonrequest


    