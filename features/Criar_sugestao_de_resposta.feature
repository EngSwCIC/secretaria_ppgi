

Feature: Enviar sugestão de resposta para uma pergunta já cadastrada
  Como usuário,
  Quero cadastrar uma sugestão de resposta para uma pergunta já cadastrar
  Para que eu possa ajudar os administradores do sistema

  Scenario:
    Given Que Usuario esteja logado como email "teste@teste1.com" e "123teste"
    And Esteja página inicial e logado
    And  Clicar no link "FAQS"
    When Clicar em alguma pergunta
    When O Clicar no botão "Adicionar Sugestão"
    Then O usuário preenche os campos de texto "fieldResposta" com uma "resposta"
    Then O usuário clica "Salvar Sugestão"
    Then será cadastrado uma nova sugestão de pergunta e resposta


  @pending
  Scenario: Titulo
      Dado Realizacao
      Quando Tipo de Usuario
      Entao Objetivo
      Exemplos:
      | Razao   |
      | Valor 1 |
      | Valor 2 |
