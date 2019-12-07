Feature: Edit Information

    Background:
        Given I'm an administrator
        And exists an information in the database
        And I'm on the "information" page
        When I click on the "Editar" link
    
    Scenario: Edit an information
        Then I should see "Alterando Informaçao"

    Scenario:
        And I click on the "Mostrar" link
        Then I should see "Título"
        And I should see "Texto"
        When I click on the "Alterar" link
        Then I should see "Alterando Informaçao"
    
    Scenario:
        And I click on the "Mostrar" link
        Then I should see "Título"
        And I should see "Texto"
        When I click on the "Voltar" link
        Then I should see "Criar Informação"
    
    Scenario:
        When I click on the "Update Information" button
        Then I should see "Informação foi atualizada com sucesso."



