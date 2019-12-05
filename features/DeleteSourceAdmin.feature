Feature: Delete a Source

    Delete a source of information from the database

    Background:
        Given I'm an administrator
        And exists a source on the database
        And I'm on the "Source" page

    Scenario: Deleting Source
        When I click on the "Destroy" button
        Then I should see "Are you sure?"
        When I click on the "Ok" button
        Then I should see "Source was successfully destroyed."
    
    Scenario: Not Deleting a Source
        When I click on the "Destroy" button
        Then I should see "Are you sure?"
        When I click on the "Cancelar" button
        Then I should not see "Source was successfully destroyed."


      