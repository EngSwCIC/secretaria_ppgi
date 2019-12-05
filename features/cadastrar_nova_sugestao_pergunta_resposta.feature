Feature: Nova sugestao de pergunta e resposta
Scenario: Usuario logado insere nova sugestao de pergunta e resposta
    Given Usuario logado "student_capivara2@student.com" e "admin123"
    And Esta em faqs
    When O usuario clica "Sugerir um FAQ"
    Then Esta na tela que possui os campos "titulo","pergunta","resposta"
    When O usuario preenche com "titulo2","pergunta2","resposta2"
    And Adiciona clicando em "Create Faq sugestion"
    Then Nova sugestao para pergunta e resposta  foi adicionada

Scenario: Administrador nao consegue sugerir uma pergunta
    Given Administrador logado "admin_capibara2@student.com" e "admin123"
    And Esta em faqs
    Then O usuario nao consegue visualizar o botao "Sugerir um FAQ"
    When O usuario acessa o caminho "/faq_sugestions/new"
    When O usuario preenche com "titulo2","pergunta2","resposta2"
    And Adiciona clicando em "Create Faq sugestion"
    Then O usuario nao pode criar uma nova sugestao

Scenario: Usuario logado pode editar uma sugestao de pergunta recém enviada
    Given Usuario logado "student_capivara2@student.com" e "admin123"
    And Esta em faqs
    When O usuario clica "Sugerir um FAQ"
    Then Esta na tela que possui os campos "titulo","pergunta","resposta"
    When O usuario preenche com "titulo2","pergunta2","resposta2"
    And Adiciona clicando em "Create Faq sugestion"
    When O usuario clica "Editar"
    When O usuario preenche com "titulo3","pergunta3","resposta3"
    And Adiciona clicando em "Update Faq sugestion"
    Then O usuario deve ver o topico como "titulo3", pergunta como "pergunta3" e resposta como "resposta3"

Scenario: Usuario logado nao consegue inserir sugestoes com campos vazios
    Given Usuario logado "student_capivara2@student.com" e "admin123"
    And Esta em faqs
    When O usuario clica "Sugerir um FAQ"
    Then Esta na tela que possui os campos "titulo","pergunta","resposta"
    When O usuario preenche com "","",""
    And Adiciona clicando em "Create Faq sugestion"
    Then Deve aparecer um erro na tela indicando que não foi possivel salvar