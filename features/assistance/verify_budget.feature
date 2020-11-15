#language:pt

Funcionalidade: Verificar se há orçamento disponível
  Como um administrador
  Para que eu possa disponibilizar os auxílios
  Eu gostaria de verificar se ainda há orçamento disponível para diárias e passagens

  Contexto:
    Dado que eu esteja cadastrado como administrador, com o email "admin@admin.com" e a senha "123456"
    E que eu esteja autenticado com o email "admin@admin.com" e a senha "123456"
    E que esteja na pagina inicial
    E que eu clique no botão Verificar Orçamento

  Cenário: Orçamento carrega corretamente
    Dado que a página é carregada corretamente
    E que eu tenha 500.00 de orçamento disponível
    Então o valor 500.00 é exibido

  Cenário: Exibição do orçamento falha
    Dado que a página é carregada corretamente
    E que eu tenha 500.00 de orçamento disponível
    E um valor diferente de 500.00 é exibido
    Então uma mensagem de erro deve ser exibida.