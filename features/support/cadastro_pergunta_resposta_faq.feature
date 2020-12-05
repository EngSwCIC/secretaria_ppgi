Feature: Cadastro de Pergunta e Resposta para o FAQ
Como um usuário, para que eu possa ajudar no levantamento de perguntas, eu gostaria de fazer uma sugestão de pergunta e dar uma sugestão de resposta

Scenario: Usuário administrador cadastra nova pergunta e resposta em FAQ
    Given Usuário está logado com "admin@cucumber.com" e "admin123"
    And Usuário se encontra na tela de FAQ
    When O usuário clica no botão "Adicionar Pergunta e Resposta"
    Then O usuário preenche os campos de texto "fieldPergunta" e "fieldResposta" com uma "pergunta" e "resposta"
    Then O usuário clica no botão "Salvar"
    Then É cadastrado um novo par Pergunta e Resposta

Scenario: Usuário administrador cadastra nova pergunta e resposta em FAQ
    Given Usuário está logado com "admin@cucumber.com" e "admin123"
    And Usuário se encontra na tela de FAQ
    When O usuário clica no botão "Adicionar Pergunta e Resposta"
    Then O usuário preenche os campos de texto "fieldPergunta" com uma "pergunta"
    Then O usuário clica no botão "Salvar"
    Then É rejeitado o cadastro de uma nova resposta
    Then Exibe um alerta "É necessário cadastrar uma resposta"

Scenario: Usuário sem privilégios não pode interagir com botão de Adicionar Pergunta e Resposta
    Given Usuário não logado com conta de administrador
    And Usuário se encontra na tela de FAQ
    Then O botão "Adicionar Pergunta e Resposta" deve estar indisponível

Scenario: Usuário sem privilégios pode interagir com botão de Adicionar Sugestão de Pergunta e Resposta
    Given Usuário não logado com conta de "teste@teste1.com"
    And Usuário se encontra na tela de FAQ
    Then O botão "Adicionar Sugestão de Pergunta e Resposta" deve estar disponível

Scenario: Usuario cadastra nova pergunta e resposta em FAQ
    Given Usuario esta logado com o email "teste@teste1.com"
    And Usuario se encontra na tela de FAQ
    When O usuário clica no botão "Adicionar Pergunta e Resposta"
    Then O usuário preenche os campos de texto "fieldPergunta" e "fieldResposta" com uma "pergunta" e "resposta"
    Then O usuário clica no botão "Salvar"
    Then É cadastrado um novo par de sugestão Pergunta e Resposta 

Scenario: Usuario cadastra nova pergunta e resposta em FAQ
    Given Usuario esta logado com o email "teste@teste1.com"
    And Usuario se encontra na tela de FAQ
    When O usuário clica no botão "Adicionar Pergunta e Resposta"
    Then O usuário preenche os campos de texto "fieldPergunta"  com uma "pergunta"
    Then O usuário clica no botão "Salvar"
    Then É rejeitado o cadastro de uma nova resposta
    Then Exibe um alerta "É necessário cadastrar uma resposta para sua sugestão"