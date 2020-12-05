Feature: Notify interested users of published information.

Background: 
	Given I'm an administrator
        When I press "Notificações"
    	Then I should see "Notificações" 

Scenario: create a new notification with new content (happy path)
        When I click on the "Nova Notificação" link
        Then I should see "Nova Notificação"
        When I fill the form with a notification which content does not exist as another notification's content
        And I click in the "Enviar" button
        Then I should see "Notificação criada com sucesso."
        
Scenario: create a notification with content that already exists as another notification's body (sad path)
        When I click on the "Nova Notificação" link
        Then I should see "Nova Notificação"
        When I fill the form with a notification which content already exists as another notification's content
        And I click in the "Enviar" button
        Then I should see "Ocorreu um erro."
