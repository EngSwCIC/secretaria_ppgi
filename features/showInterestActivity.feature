#language: en

#Como um usuário, para que eu possa me informar,
#eu gostaria de ver as atividades que eu demonstrei interesse #40

Feature: User actions
	To use calendar
	As a system user
	I would like to see interests activities

	Background: User logged in
		Given I am on the sign up page
		And I fill in 'email' with 'student@student.com'
		And I fill in 'full_name' with 'alunao'
		Then 'student' should be an option for 'role'
		And I fill in 'password' with 'admin123'
		And I fill in 'password_confirmation' with 'admin123'
		When I press 'Sign up'
		Then I should be on 'root_path' page

	
	Scenario: See Calendar page
		When I press 'Calendar'
		Then I should be on 'calendar' page
		When I check 'Mostrar apenas minhas atividades de interesse'
		Then I should see on 'calendar' page only 'interests activities'
		
	Scenario: See Activities page
		When I press 'Atividades'
		Then I should be on 'activities' page
		When I press 'Filtrar por Interesse'
		Then I should be on 'activities' page
