Feature: Ver perguntas por topico
Como um usuário, para que eu possa me informar, eu gostaria de ver as perguntas separadas por tópicos

Scenario: Ver pergunta por um topico
    Given Que o usuário esta na tela "/faqs"
    And a pergunta "como_editar", a resposta "editando" do tópico "editar_cadastro" existem
    Then Ele pode visualizar a pergunta "como_editar", a resposta "editando" do tópico "editar_cadastro"

Scenario: Ver pergunta por um topico
    Given Que o usuário esta na tela "/faqs"
    And a pergunta "como_editar", a resposta "editando" existem
    And nenhum tópico está disponível 
    Then Ele não pode visualizar a pergunta "como_editar", a resposta "editando" separado por tópico