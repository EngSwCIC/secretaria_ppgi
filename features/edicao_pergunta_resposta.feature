Feature: Editar resposta cadastrada
Como um administrador, para que eu mantenha as perguntas e respostas atualizadas, eu gostaria de editar uma resposta já cadastrada

Scenario: Usuário administrador edita pergunta ou resposta
    Given que um usuário admin está logado
    And ele está na tela onde os faqs são exibidos
    And  a pergunta "como_editar", a resposta "editando" do tópico "editar_cadastro" existem
    When o usuário administrador clicar no botão editar para alterar a pergunta "como_editar", a resposta "editando" do tópico "editar_cadastro"
    Then deve carregar a tela que edita a pergunta "como_editar", a resposta "editando" do tópico "editar_cadastro"
    When preenche o campo titulo, pergunta e resposta com um "titulo", "pergunta" e "resposta"
    And clica no botao "Atualizar"
    Then a pergunta, resposta e topico sao atualizados


Scenario: Usuario que não é adminstrador tenta editar uma pergunta ou resposta
    Given que o usuario está logado
    And o usuário não é um administrador
    And o usuário esta na tela onde os faqs são exibidos
    Then o usuario nao pode visualizar o botao "editar"

