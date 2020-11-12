#language: pt
#encoding: utf-8

Funcionalidade: Solicitar passagens
  Como um usuário 
  Para que eu possa receber o auxílio 
  Eu gostaria de fazer uma solicitação de passagens para um período.

  Contexto: 
    Dado que eu esteja cadastrado como usuario:
    {
      "full_name": "Usuário",
      "email": "user@user.com",
      "password": "user123",
      "role": "user",
      "registration": "000000000"
    }

    E que eu esteja autenticado
    E que eu esteja na pagina inicial
    E eu clicar no botão "Solicitar passagens"

  Cenário:
    Caso a página de solicitação de passagens seja carregada corretamente 
    E exista haver um botão para escolher um período para fazer uma solicitação
    Então eu devo estar em uma página com uma tabela com os dados:

    | solicitation | name |
    | period | 30/10/2020 - 01/11/2020 |

  Cenário:
    Não é possível fazer uma solicitação de passagens para o período escolhido
    Não há dados cadastrados para o usuário fazer uma solicitação e receber auxílio