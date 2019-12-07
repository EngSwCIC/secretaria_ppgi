Feature: Delete a Source

    Delete a source of information from the database

    Background:
        Given I'm an administrator
        And exists a source on the database
        And I'm on the "sources" page

    Scenario: Deleting Source
        When I click on the "Destroy" link
        Then I should see "Source was successfully destroyed."


      