#language: en

#Como um usuário, para que eu possa me informar,
#eu gostaria de ver as atividades que eu demonstrei interesse #40

Feature: User actions
	To use calendar
	As a system user
	I would like to see interests activities

	Background: User logged in
		Given I am on the '/' page and clik on 'Entrar'
		And I fill in 'email' with 'student@student.com'
		And I fill in 'password' with 'admin123'
		When I press 'Log in'
		Then I should be on '/'

	Scenario: See Activities page
		Given I am on the 'activities' page
		When I check 'teste aluno'
		And I press 'Marcar interesse'
		Then I should be on 'activities' page

	Scenario: See Calendar page
		Given I am on the 'activities' page
		When I check 'Mostrar apenas minhas atividades de interesse'
		Then I should see on 'activities' page only 'interests activities'
		
