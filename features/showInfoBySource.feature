Feature: System user can view the information according to the information source

    As a system user
    So that I can can view the information according to the source
    I want to select the information source

Background: Start from the user page
    
    Given I am logged in as user on SecretariaPpgi
    When  I press "Informações"
    Then I should see "Filtrar por fonte"  

Scenario: Filter information by source (happy path)
    
    When I select the information source from the list of registered sources
    And I press "Filtrar"
    Then I should be on the SecretairiaPpgi informations page
    And I should see the published informations from the selected source

Scenario: Filter information by source that has not yet published any information (sad path)
    
    When I select the information source from the list of registered sources
    And I press "Filtrar"
    Then I should be on the SecretairiaPpgi informations page
    And I should see an warning message: "Nenhuma Informação publicada pela fonte selecionada!"

    