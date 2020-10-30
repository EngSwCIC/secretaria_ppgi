#language: pt
#encoding: utf-8

Funcionalidade: 
  Lista todas as Solicitações de acordo com as suas prioridades


Contexto:
    Dado que eu esteja cadastrado como Usuario:
    {
       full_name: "Administrador",
       email: "admin@admin.com", 
       password: "admin123", 
       role: "administrator", 
       registration: "000000000"
    }

    E que esteja autenticado
    E que esteja na pagina inicial
    E eu clicar no link "Painel de Administrador"
    E eu clicar em “Lista de Solicitações”
   Cenário Feliz:
    Lista de Solicitações aparece adequadamente
    E exista a Solicitação [ Model ainda não definida ]
    Então eu devo estar em uma página com uma tabela mostrando os dados ordenados
    | Key | | Value |

 Cenário Triste:
    Lista de Solicitações encontra erro ao renderizar por dados corrompidos no banco
    Não existe solicitações criadas e a lista não mostra mensagem
    Navegador do usuário não suporta o sistema
