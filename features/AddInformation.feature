Feature: System administrator can manually add information

    As a system administrator
    So that I can keep the users informed
    I want to add new information manually

Background: Start from the administrator page
    
    Given I am logged as an "administrador" on SecretariaPpgi
    When I click "Adicionar uma nova informação"  
    Then I should go to the "informations/new" page

Scenario: Add new information (happy path)
    
    When I fill the new information form with some information not yet registered
    And I click "Publicar informação"
    Then I should go to the "SecretariaPpgi informations page"
    And I should see published the information I just recently added

Scenario: Add information that has already been added (sad path)
    
    When I fill the new information form with information that has already been added
    And I click "Publicar informação"
    Then I should go to the "new information" form page 
    And I should see an error message: "Erro: Informação já publicada."
    