#language: en

#Como um usuário, para que eu possa me informar,
#eu gostaria de ver as atividades que eu demonstrei interesse #40

Feature: User actions
	To use calendar
	As a system user
	I would like to see interests activities

	Background: User logged in
		Given I am on the '/' page and click on 'Entrar'
		And I fill in 'email' with 'student@student.com'
		And I fill in 'password' with 'admin123'
		When I click on 'Log in'
		Then I should be on '/'

	Scenario: See Activities page
		Given I am on the 'activities' page
		When I click on 'Minhas atividades'
		Then I should be on '/user_activities' page

	Scenario: See Error page
		Given I am on the 'activities' page
		When I click on 'Minhas atividades'
		Then I should be on '/404' page
		
