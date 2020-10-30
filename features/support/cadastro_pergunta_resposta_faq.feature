Feature: Cadastro de Pergunta e Resposta para o FAQ
Scenario: Usuário administrador cadastra nova pergunta e resposta em FAQ
    Given Usuário está logado com "admin@cucumber.com" e "admin123"
    And Usuário se encontra na tela de FAQ
    When O usuário clica no botão "Adicionar Pergunta e Resposta"
    Then O usuário preenche os campos de texto "fieldPergunta" e "fieldResposta" com uma "pergunta" e "resposta"
    Then O usuário clica no botão "Salvar"
    Then É cadastrado um novo par Pergunta e Resposta
Scenario: Usuário sem privilégios não pode interagir com botão de Adicionar Pergunta e Resposta
    Given Usuário não logado com conta de administrador
    And Usuário se encontra na tela de FAQ
    Then O botão "Adicionar Pergunta e Resposta" deve estar indisponível