Feature: User can view all published informations

	As a system user
	So that I can keep myself informed
	I would like to view all the information made available
	
Background: Start from the user home page
	Given I have logged in on SecretariaPpgi
	When I press "Informações"
	Then I should be on the "informations/index" page
	
Scenario: View all the information made available (happy path)
	Then I should see all published informations

Scenario: Try to view unavailable information (sad path)
	Then I should see "Nenhuma informação publicada"
