Feature: Notify interested users of published information.

Background: 
	Given I'm an administrator
        When I press "Notificações"
    	Then I should see "Notificações" 

Scenario: create a new list
        When I click on the "Nova Lista" link
        Then I should see "Nova Lista"
        When I fill the form with:
        |Title | Info |
        And I click in the "Save" button
        Then I should see "List Saved Successfully."
        
Scenario: edit list
        When I click on the "Edit" link on the "Professor"
        Then I should see "Include Record"
        When I fill the form with:
        |Name | Email |
        And I click in the "Save" button
        Then I should see "List Successfully Edited."
        
Scenario: send message
        When I click on the "Send" link
        Then I should see "select list"
        And I click in the "Professor" button
        When I fill the form with:
        |Title | Message |
        And I click in the "Submit" button
        Then I should see "Message sent successfully."
   
