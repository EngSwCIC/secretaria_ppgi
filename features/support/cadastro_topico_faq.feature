Feature: Cadastro de Topico para o FAQ
Scenario: Usuário administrador cadastra novo tópico para organizar FAQ
    Given Usuário está logado com "admin@cucumber.com" e "admin123"
    And Usuário se encontra na tela de FAQ
    When O usuário clica no botão "Adicionar tópico"
    Then O usuário preenche o campo de texto "Tópico" com um "topico"
    Then O usuário clica no botão "Salvar"
    Then É cadastrado um novo tópico
Scenario: Usuário sem privilégios não pode interagir com botão de adicionar Tópico
    Given Usuário não logado com conta de administrador
    And Usuário se encontra na tela de FAQ
    Then O botão "Adicionar tópico" deve estar indisponível