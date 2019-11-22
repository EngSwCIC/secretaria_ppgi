Feature: Editar Topico/pergunta/resposta
Scenario: Adm edita pergunta/resposta
    Given Que o usuario esta logado utilizando "admin@cucumber.com" e "admin123"
    And O usuario esta na tela de exibicao dos faqs
    And  O topico "topico_cucumber",a pergunta "pergunta_cucumber" e a resposta "resposta_cucumber" existem
    When Clica no botao editar para editar o topico "topico_cucumber",a pergunta "pergunta_cucumber" e a resposta "resposta_cucumber"
    Then Deve estar na tela em que edita o topico "topico_cucumber",a pergunta "pergunta_cucumber" e a resposta "resposta_cucumber"
    When Preenche o titulo,pergunta,resposa com uma "titulo","pergunta","resposta"
    And Clica no botao de "Update faq"
    Then O topico,a pergunta e a resposta sao atualizados


Scenario: Usuario que nao seja admin nao pode editar pergunta/resposta
    Given Que o usuario nao esta logado
    And O usuario esta na tela dos faqs
    Then O usuario nao pode visualizar o botao "editar"

