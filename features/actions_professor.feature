Feature: Professor actions
	To use application resources
	As a system professor
	I would like to do all professor actions

	Background: User logged in
		Given I am on the sign up page
		And I fill in 'email' with 'professor@professor.com'
		And I fill in 'full_name' with 'prof'
		Then 'professor' should be an option for 'role'
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
		When I press 'Filtrar por Interesse'
		Then I should be on 'activities' page

	Scenario: Perfil Edit page
		When I press 'Editar Perfil'
		Then I should be on 'edit' page
