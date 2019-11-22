Feature: Add a new information source. 

   As a administrator, I should be able to add a new source of information.

   Scenario: Adding source
    Given I'm an administrator
    And I'm on the first page
    When I click in Criar Informação button
    Then I should be able to see the Adicionar Fonte button 

   Scenario: Adding new source to database
    Given I'm an administrator
    And I'm on the source management page
    Then I should be able to add a source with name CiC