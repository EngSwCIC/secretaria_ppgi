Feature: System administrator can manually add information

    As a system administrator
    So that I can keep the users informed
    I want to add new information manually

Background: Start from the administrator page
    
    Given I am logged in as administrator on SecretariaPpgi
    Then I should see "Adicionar uma nova informação"  

Scenario: Add new information (happy path)
    
    When I fill the new information form with information not yet registered
    And I press "Publicar informação"
    Then I should be on the SecretairiaPpgi informations page
    And I should see published the information I just recently added

Scenario: Add information that has already been added (sad path)
    
    When I fill the new information form with information that has already been added
    And I press "Publicar informação"
    Then I should be on the "new information" form page 
    And I should see an error message: "Erro: Informação já publicada."
    