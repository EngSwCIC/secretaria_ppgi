Feature: Nova sugestao de pergunta e resposta
Scenario: Usuario logado insere nova sugestao de pergunta e resposta
    Given Usuario logado "student_capivara2@student.com" e "admin123"
    And Esta em faqs
    When O usuario clica "Sugerir um FAQ"
    Then Esta na tela que possui os campos "titulo","pergunta","resposta"
    When O usuario preenche com "titulo2","pergunta2","resposta2"
    And Adiciona clicando em "Create Faq sugestion"
    Then Nova sugestao para pergunta e resposta  foi adicionada