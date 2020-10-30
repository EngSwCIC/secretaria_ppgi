


Feature: Criar uma sugestão de pergunta e dar uma sugestão de resposta
  Como usuário,
  Quero cadastrar uma sugestão para de pergunta e também sugirir uma resposta para a pergunta
  Para que eu possa ajudar no levatamento de perguntas


  Scenario:
    Given Que Usuario esteja logado como email "teste@teste1.com" e "123teste"
    And Esteja página inicial e logado
    And  Clicar no link "FAQS"
    When O Clicar no botão "Adicionar Sugestão"
    Then O usuário preenche os campos de texto "fieldPergunta" e "fieldResposta" com uma "pergunta" e "resposta"
    Then O usuário clica "Salvar Sugestão"
    Then será cadastrado uma nova sugestão de pergunta e resposta



@pending
