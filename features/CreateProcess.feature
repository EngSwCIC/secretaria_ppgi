Feature: User can create a process by entering his name, type and description of the process.

  As a postgraduate student
  So that I can create a new process easily
  I want to create a new process entering my name, type and description

  Background: Start from the Criar Processo page
    Given I am on the Processos home page
    Then I follow "Criar"

  Scenario: Try to create a process (happy path)
    Given I am on the Criar Processo home page
    When I fill in "name" with "Jose"
    And I fill in "description" with "Quero trancar"
    And I press "Criar Processo"
    Then I should see "Visualização de Processo"

  Scenario: Try to create a process (sad path)
    Given I am on the Criar Processo home page
    And I fill in "description" with "Quero trancar"
    And I press "Criar Processo"
    Then I should see "Não foi possivel criar o Processo"