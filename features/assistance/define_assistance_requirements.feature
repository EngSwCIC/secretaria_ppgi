#language:pt

Funcionalidade: Definir os requisitos para solicitação de auxílio
  Como um administrador 
  Para que eu possa disponibilizar diárias e passagens 
  Eu gostaria de disponibilizar os requisitos para fazer uma solicitação

  Contexto:
    Dado que eu esteja cadastrado como administrador, com o email "admin@admin.com" e a senha "123456"
    E que eu esteja autenticado com o email "admin@admin.com" e a senha "123456"
    E que esteja na pagina inicial
    E que eu clique no botão de edição de requisitos de solitação de auxílio

  Cenário: Edição de requisitos é bem sucedida
    Dado que a página é carregada corretamente
    E que eu insira o requisito "Idade maior que 18 anos"
    E clique no botão de confirmação de edição
    Então os requisitos são atualizados

  Cenário: Edição de requisitos contém requisito em branco
    Dado que a página é carregada corretamente 
    E que eu remova os requisitos existentes
    E clique no botão de confirmação de edição
    Então uma mensagem de erro, é exibida, indicando que os requisitos não podem ficar em branco