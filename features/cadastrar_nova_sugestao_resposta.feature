Feature: Nova sugestao de resposta
Scenario: Usuario logado insere nova sugestao de respsota para uma pergunta existente
    Given Que o usuario esta logado com as credenciais "student_capivara@student.com" e "admin123"
    And O usuario esta na tela de faqs
    And Existe pelo menos um topico cadastrado
    When O usuario clica no botao com nome "Nova Sugestão de Resposta"
    Then O usuario deve estar na tela em que existe o campo,"resposta"
    When O usuario preenche o campo respostaa com uma "resposta"
    And O usuario clica em "Create Faq sugestion"
    Then Um nova sugestao foi adicionada