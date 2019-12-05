Feature: Add a new information source. 

   As a administrator, I should be able to add a new source of information.

   Background:
      Given I'm an administrator
      And I'm on the "Information" page
   
   Scenario: Verifying Source
      When I click on the "Sources" button
      Then I should see "Sources"

   Scenario: Adding Source
      When I click on the "Adicionar Fonte" button
      And I the fill the form with:
      |Title | Departamento Qualquer|
      And I click on the on the "Create Source" button
      Then I should see "Source was successfully created."
