Feature: Edit Source

    Edit a source from the database.

    Background: 
        Given I'm an administrator
        And I'm on the "Sources" page

    Scenario: Editing Source
        When I click on the "Edit" button
        Then I should see "Editing Source"
        When I fill the form with:
        |Title | Test |
        And I click in the "Update Source" button
        Then I should see "Source was successfully updated."
