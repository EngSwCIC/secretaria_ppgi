#language: pt
#encoding: utf-8

Funcionalidade: Definir prazo de solicitação de passagens e diárias
  Como um administrador 
  Para que eu possa disponibilizar diárias e passagens
  Eu gostaria de definir o prazo para solicitação de passagens

  Contexto: 
    Dado que eu esteja cadastrado como Administrador:
    {
      "full_name": "Administrador",
      "email": "admin@admin.com",
      "password": "admin123",
      "role": "admin",
      "registration": "000000000"
    }

    E que eu esteja autenticado como "admin"
    E que eu esteja na pagina inicial
    E eu clicar no botão "Definir prazo"

  Cenário: O prazo de solicitações é definido corretamente
    Caso a página de definir um prazo seja carregada corretamente 
    E exista um botão com a opção de "Prazo" para que eu possa escolher um período
    Então eu devo estar em uma página com uma tabela com os dados:

    | type | value |
    | Deadline | 30/10/2020 - 01/11/2020 |

  Cenário: Período inválido é inserido
    Não coloco uma período válido e é inviável fazer solicitações 
    