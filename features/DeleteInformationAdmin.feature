Feature: Delete Information

    Background:
        Given I'm an administrator
        And exists an information in the database
        And I'm on the "information" page
    
    Scenario: Delete an information
        When I click on the "Destruir" link
        Then I should see "Informação foi destruída com sucesso."