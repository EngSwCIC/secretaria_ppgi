Feature: Admin actions
	To use application resources
	As a system admin
	I would like to do all admin actions

	Background: Admin logged in
		Given I am on the sign up page
		And I fill in 'email' with 'admin@admin.com'
		And I fill in 'full_name' with 'adminzao'
		Then 'administrator' should be an option for 'role'
		And I fill in 'password' with 'admin123'
		And I fill in 'password_confirmation' with 'admin123'
		When I press 'Sign up'
		Then I should be on 'root_path' page

	Scenario: Log out from homepage using 'Sair'
		When I press 'Sair'
		Then I should be on 'root_path' page

	Scenario: Log out from homepage using 'Log out'
		When I press 'Log out'
		Then I should be on 'root_path' page

	Scenario: See Activities page
		When I press 'Atividades'
		Then I should be on 'activities' page

	Scenario: Perfil Edit page
		When I press 'Editar Perfil'
		Then I should be on 'edit' page

	Scenario: New Activity page
		When I press 'Nova Atividade'
		Then I should be on 'new activity' page
