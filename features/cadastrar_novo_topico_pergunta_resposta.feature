Feature: Novo Topico/pergunta/resposta
Scenario: Adm insere um novo topico para uma pergunta e resposta
    Given Que o usuario esta logado com "admin@cucumber.com" e "admin123"
    And O usuario esta na tela de exibicao do faq
    When O usuario clica no botao "nova entrada no faq"
    Then O usuario deve estar na tela em que insere o "titulo","pergunta","resposta"
    When O usuario preenche o titulo,pergunta,resposa com uma "titulo","pergunta","resposta"
    And O usuario clica no botao de "adicionar um novo faq"
    Then Um novo faq e adicionado
Scenario: Usuario que nao seja admin nao pode inserir novo Topico/pergunta/resposta
    Given Que o usuario nao esta logado
    And O usuario esta na tela dos faqs
    Then O usuario nao pode visualizar o botao "adicionar um novo faq"
    When O usuario acessa a rota "/faqs/new"
    And Clica em "Create Faq"
    Then O usuario nao pode criar um novo faq