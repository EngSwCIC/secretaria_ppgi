Funcionalidade: Realizar solicitação de diárias para um período
    Como um usuário
    Para que eu possa receber o auxílio
    Eu gostaria de fazer uma solicitação de diárias para um período

    Contexto: 
        Dado que eu esteja cadastrado como usuario:
        {
            "full_name": "Usuário",
            "email": "user@user.com",
            "password": "user123",
            "role": "user",
            "registration": "000000000"
        }

        E que esteja autenticado
        E que esteja na pagina inicial
        E eu clicar no botão "Solicitar diárias"

    Cenário: A solicitação de passagens é bem sucedida
        A página para solicitação de diárias é carregada.
        E existe um campo para inserção de data de entrada
        E existe um campo para inserção de data de saída
        Então eu devo estar em uma página de confirmação com a tabela:

        | data de entrada | dd/mm/aaaa |
        | data de saída   | dd/mm/aaaa |

    Cenário triste: Usuário envia dados em formato inválido
        O usuário insere uma data inválida
        O usuário insere um valor não numérico