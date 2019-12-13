Feature: User can update the status of the process.

  As a secretary
  So that I can keep processes in order
  I want to change the status of the process

  Background: Start from the Atualizar Processo form on the home page
    Given I am on the Processos home page
    Then I follow "1"

  Scenario: Try to update the process (happy path)
    Given I am on the Processo 1 home page
    And I press "Editar"
    Then I should be on the Editar Processo 1 home page
    And I fill in "name" with "Joao"
    And I fill in "description" with "Trancar coisa"
    And I select "Em andamento" from "Status"
    And I press "Editar Processo"
    Then I should see "..."

  Scenario: Try to update the process (sad path)
    Given I am on the Processo 1 home page
    When I fill in "description" with "Trancar coisa"
    And I press "Editar Processo"
    Then I should see "Não foi possivel..."