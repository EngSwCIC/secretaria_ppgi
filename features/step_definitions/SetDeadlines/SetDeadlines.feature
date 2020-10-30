#language: pt
#encoding: utf-8

Funcionalidade: Como um administrador, para que eu possa disponibilizar diárias e passagens, eu gostaria de definir o prazo para solicitação de passagens

Contexto: 
  Dado que eu esteja cadastrado como Administrador:
  {
    "full_name": "Administrador",
    "email": "admin@admin.com",
    "password": "admin123",
    "role": "admin",
    "registration": "000000000"
  }

  E que eu esteja autenticado
  E que eu esteja na pagina inicial
  E eu clicar no botão "Definir prazo"

  Cenário feliz:
  A página de definir um prazo é carregada corretamente 
  E deve haver um botão para escolher um período a ser definido
  Então eu devo estar em uma página com uma tabela com os dados:

  | type | value |
  | Deadline | 30/10/2020 - 01/11/2020 |

  Cenário triste:

  Não coloco uma período válido e é inviável fazer solicitações 
  