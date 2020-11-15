Feature: Notify interested users of published information.

Background: 
	Given I'm an administrator
        And logged in as administrator on SecretariaPpgi
        When I press "Lista de Grupos de Informações"
    	Then I should see "Filtrar por fonte" 

Scenario: create a new list
        When I click on the "New" link
        Then I should see "New List"
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
   
