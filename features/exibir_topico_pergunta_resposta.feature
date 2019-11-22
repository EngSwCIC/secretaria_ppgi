Feature: Exibir Topico/pergunta/resposta
Scenario: Qualquer usuario pode visualizar os topicos,perguntas e respostas
    Given Que o usuario esta em "/faqs"
    And Existe o topico "topico_cucumber",a pergunta "pergunta_cucumber" e a resposta "resposta_cucumber"
    Then E possivel visualizar o topico "topico_cucumber",a pergunta "pergunta_cucumber" e a resposta "resposta_cucumber"