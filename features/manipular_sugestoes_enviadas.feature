Feature: Administradores visualizar e manipular sugestões enviadas

Scenario: Usuario nao admin não consegue visualizar sugestoes enviadas
    Given Que o usuario esta logado com as credenciais "student_capivara@student.com" e "admin123"
    And O usuario esta na tela de faqs
    Then O usuario nao consegue visualizar o botao "Verificar Sugestões de FAQ"
    When O usuario tenta acessar o caminho "/faq_sugestions/"
    Then O usuario nao consegue visualizar as sugestoes

Scenario: Admin logado consegue visualizar sugestoes enviadas
    Given Administrador logado "admin_capibara2@student.com" e "admin123"
    And Esta em faqs
    When O usuario clica "Verificar Sugestões de FAQ"
    Then Ele está na página com as sugestoes de FAQ