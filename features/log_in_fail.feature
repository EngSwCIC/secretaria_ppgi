Feature: Log in
	To use application resources
	As a system user
	I would like to log in with my account

	Scenario: Sign in a valid admin
		Given I am on the sign in page
		And I fill in 'email' with 'admin@admin.com'
		And I fill in 'password' with 'admin123'
		When I press 'Log in'
		Then I should be on 'new_session_path' page

	Scenario: Sign in a valid student
		Given I am on the sign in page
		And I fill in 'email' with 'student@student.com'
		And I fill in 'password' with 'admin123'
		When I press 'Log in'
		Then I should be on 'new_session_path' page

	Scenario: Sign in a valid secretary
		Given I am on the sign in page
		And I fill in 'email' with 'secretary@secretary.com'
		And I fill in 'password' with 'admin123'
		When I press 'Log in'
		Then I should be on 'new_session_path' page

	Scenario: Sign in a valid professor
		Given I am on the sign in page
		And I fill in 'email' with 'professor@professor.com'
		And I fill in 'password' with 'admin123'
		When I press 'Log in'
		Then I should be on 'new_session_path' page

	Scenario: Go to Sign up page
		Given I am on the sign in page
		When I press 'Sign up'
		Then I should be on 'new_registration_path' page
