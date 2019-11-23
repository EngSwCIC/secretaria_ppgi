Feature: User can update the status of the process.

  As a secretary
  So that I can keep processes in order
  I want to change the status of the process

  Background: Start from the Atualizar Processo form on the home page
    Given I am on the Processo home page
    Then I press "Atualizar Processo"

  Scenario: Try to update the process (happy path)
    Given I am on the Atualizar Processo home page
    When I fill in "Procurar Nome" with "Jose"
    And I press "Procurar"
    Then I should be on the Atualizar Processo home page
    And I select "Em andamento" from "Status"
    And I press "Atualizar"
    Then I should see "Atualizacao feita"

  Scenario: Try to update the process (sad path)
    Given I am on the Atualizar Processo home page
    When I fill in "Procurar Nome" with "Nome que nao existe"
    And I press "Procurar"
    Then I should see "Nao foi encontrar esse nome"