Feature: Information Interaction

    Background:
        Given I'm an student
        And exists an information in the database
        And I'm on the "information" page
    
    Scenario:
        Then I should see "Informações"
        And I should not see "Editar"
        And I should not see "Destruir"
    
    Scenario:
        When I click on the "Ver" link
        Then I should see "Título"
        And I should see "Texto"
        When I click on the "Voltar" link
        Then I should see "Informações"