Feature: Welcome page
	To use application resources
	As a system user
	I would like to see the welcome page

	Scenario: Go to log in page
		Given I am on the root_path page
		And I press 'Entrar'
		Then I should be on 'new_session_path' page

