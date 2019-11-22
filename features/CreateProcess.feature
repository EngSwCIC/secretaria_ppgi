Feature: User can create a process by entering his name, type and description of the process.

  As a postgraduate student
  So that I can create a new process easily
  I want to create a new process entering my name, type and description

  Scenario: Try to create a process (happy path)
    Given I am on the Criar Processo home page
    When I fill in "Nome" with "Jose"
    And I select "Aluno" from "Cargo"
    And I select "Trancamento de Matricula" from "Tipo"
    And I fill in "Descricao" with "Quero trancar"
    And I press "Concluir"
    Then I should be on the Criar Processo home page
    And I should see "Operacao realizada com sucesso"

  Scenario: Try to create a process (sad path)
    Given I am on the Criar Processo home page
    When I select "Trancamento de Matricula" from "Tipo"
    And I fill in "Descricao" with "Quero trancar"
    And I press "Concluir"
    Then I should be on the Criar Processo home page
    And I should see "Operacao mal sucedida"