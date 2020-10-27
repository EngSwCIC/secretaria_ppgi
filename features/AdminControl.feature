Feature: System administrator can register new source of information

    As a system administrator
    So that I can control sources of information 
    I want to register a new source of information

Background: Start from the administrator page

    Given I am logged in as "administrator" on Secretaria_Ppgi
    When I follow "Informaçoes" 
    Then I should be on "SecretariaPpgi informations page"
    When I press "Adicionar uma nova fonte de informação"
    Then I should be on "SecretariaPpgi Register Source of Inforamtion page"

Scenario: Register new source of information (happy path)

    When I fill the form with "information about the new source"
    And I press "Cadastrar fonte"
    Then I should recieve a message "Fonte cadastrada com sucesso"


Scenario: Add new source that has already been added (sad path)

    When I fill the form with "information about the new source"
    And I press "Cadastrar fonte"
    Then I should recieve a message "Fonte já consta na lista de fontes confiáveis"
    And I should be on "SecretariaPpgi Register Source of Inforamtion page"
