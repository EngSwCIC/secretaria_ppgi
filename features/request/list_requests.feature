#language:pt

Funcionalidade: Listar todas as solicitações de acordo com as suas prioridades
   Como um administrador 
   Para que eu possa disponibilizar os auxílios 
   Eu gostaria de verificar a lista de solicitações de acordo com as prioridades

   Contexto:
      # @adimn = {
      #    full_name: "Administrador",
      #    email: "admin@admin.com", 
      #    password: "admin123", 
      #    role: "administrator", 
      #    registration: "000000000"
      # }
      Dado que eu esteja cadastrado como administrador com email "admin@admin.com" 
      E que esteja autenticado como "admin"
      E que esteja na pagina inicial
      E eu clicar no link do painel de administrador
      E eu clicar em na lista de solicitações
   
   Cenário: Lista de solicitações é exibida corretamente
      Dado que Lista de Solicitações aparece adequadamente
      E exista a Solicitação "[ Model ainda não definida ]"
      Então eu devo estar em uma página com uma tabela mostrando os dados ordenados
      | Key | | Value |

   #cenario triste
   # Cenário: Ocorre um erro na exibição da lista
   #    Lista de Solicitações encontra erro ao renderizar por dados corrompidos no banco
   #    Não existe solicitações criadas e a lista não mostra mensagem
   #    Navegador do usuário não suporta o sistema
