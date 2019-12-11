Feature: Sign up
	To use application resources
	As a system user
	I would like to sign up with my account

	Scenario: Sign up a valid admin
		Given I am on the sign up page
		And I fill in 'email' with 'admin@admin.com'
		And I fill in 'full_name' with 'adminzao'
		Then 'administrator' should be an option for 'role'
		And I fill in 'password' with 'admin123'
		And I fill in 'password_confirmation' with 'admin123'
		When I press 'Sign up'
		Then I should be on 'root_path' page

	Scenario: Sign up a valid student
		Given I am on the sign up page
		And I fill in 'email' with 'student@student.com'
		And I fill in 'full_name' with 'alunao'
		And 'student' should be an option for 'role'
		And I fill in 'password' with 'admin123'
		And I fill in 'password_confirmation' with 'admin123'
		When I press 'Sign up'
		Then I should be on 'root_path' page

	Scenario: Sign up a valid secretary
		Given I am on the sign up page
		And I fill in 'email' with 'secretary@secretary.com'
		And I fill in 'full_name' with 'secretao'
		And 'secretary' should be an option for 'role'
		And I fill in 'password' with 'admin123'
		And I fill in 'password_confirmation' with 'admin123'
		When I press 'Sign up'
		Then I should be on 'root_path' page

	Scenario: Sign up a valid professor
		Given I am on the sign up page
		And I fill in 'email' with 'professor@professor.com'
		And I fill in 'full_name' with 'prof'
		And 'secretary' should be an option for 'role'
		And I fill in 'password' with 'admin123'
		And I fill in 'password_confirmation' with 'admin123'
		When I press 'Sign up'
		Then I should be on 'root_path' page

	Scenario: Go to Log in page
		Given I am on the sign up page
		When I press 'Log in'
		Then I should be on 'new_session_path' page