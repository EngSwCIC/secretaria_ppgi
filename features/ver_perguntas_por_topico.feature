Feature: Ver perguntas por topico
Scenario: Ver pergunta por um topico
    Given Que o usuário esta na tela "/faqs"
    And a pergunta "como_editar", a resposta "editando" do tópico "editar_cadastro" existem
    Then Ele pode vesualizar a pergunta "como_editar", a resposta "editando" do tópico "editar_cadastro"