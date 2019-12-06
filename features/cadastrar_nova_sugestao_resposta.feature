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

Scenario: Administrador nao consegue sugerir uma resposta para uma pergunta existente
    Given Administrador logado "admin_capibara2@student.com" e "admin123"
    And O usuario esta na tela de faqs
    And Existe pelo menos um topico cadastrado
    Then O usuario nao consegue visualizar o botao "Nova Sugestão de Resposta"

Scenario: Usuario logado pode editar uma sugestao de resposta recém enviada
    Given Que o usuario esta logado com as credenciais "student_capivara@student.com" e "admin123"
    And O usuario esta na tela de faqs
    And Existe pelo menos um topico cadastrado
    When O usuario clica no botao com nome "Nova Sugestão de Resposta"
    Then O usuario deve estar na tela em que existe o campo,"resposta"
    When O usuario preenche o campo respostaa com uma "resposta"
    And O usuario clica em "Create Faq sugestion"
    Then Um nova sugestao foi adicionada
    When O usuario clica "Editar"
    When O usuario preenche o campo respostaa com uma "resposta2"
    And Adiciona clicando em "Update Faq sugestion"
    Then O usuario deve ver a resposta como "resposta2"