#language:pt

Funcionalidade: Listar todas as solicitações de acordo com as suas prioridades
   Como um administrador 
   Para que eu possa disponibilizar os auxílios 
   Eu gostaria de verificar a lista de solicitações de acordo com as prioridades

   Contexto:
      Dado que eu esteja cadastrado como admin
      E que eu realize login com o email "admin@admin.com" e a senha "admin123"
      E que esteja autenticado na página inicial
      E eu clicar no botão "Visualizar solicitações de diárias e passagens"
      E eu clicar em na lista de solicitações
   
   Cenário: Dado que Lista de Solicitações aparece adequadamente
      E exista a Solicitação "teste"
      Então eu devo estar em uma página com uma tabela mostrando os dados ordenados
      | Documentos | | Tipos de Requisição | | Nome do Requerente |
      | teste      | | Diaria              | | Administrador2     |
       
    Cenário: 
      Dado que esteja cadastrado como usuario
      Dado que esteja autenticado e não seja administrador de email: "user@email.com" e senha: "123456"
      E tente acessar pagina de que lista as requisições
      Então a tela deve mostrando a mensagem "Você precisa ser administrador para acessar essa Pagina:"