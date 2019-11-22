Feature: Delete a source

   Delete a source of information from the database

   Scenario: Delete a source
    Given I'm an administrator
    And I'm on source management page
    When I click the Destroy button
    Then a source must be deleted