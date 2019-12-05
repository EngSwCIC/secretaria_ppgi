Feature: Add a new information

    Background:
        Given exists a source on the database
        And I'm an administrator
        And I'm on the "information" page
        When I click on the "Criar Informação" link

    Scenario: 
        Then I should see "Criando Informação"
    
    Scenario:
        And I fill the form with:
        |information_title | teste_title|
        |information_info  | teste_text |
        And I click on the "Create Information" button
        Then I should see "Informação foi criada com sucesso."
