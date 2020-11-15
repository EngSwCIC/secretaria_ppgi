#language:pt

Funcionalidade: Realizar solicitação de diárias para um período
    Como um usuário
    Para que eu possa receber o auxílio
    Eu gostaria de fazer uma solicitação de diárias para um período

    Cenário: 
        Dado que eu esteja cadastrado como usuario "user@user.com"
        # user = {
        #     "full_name": "Usuário",
        #     "email": "user@user.com",
        #     "password": "user123",
        #     "role": "user",
        #     "registration": "000000000"
        # }

        E que esteja autenticado
        E que esteja na pagina inicial
        E eu clicar no botão "Solicitar diárias"

    Cenário: A solicitação de passagens é bem sucedida
        A página para solicitação de diárias é carregada.
        E existe um campo "data_entrada" para inserção de data de entrada
        E eu insira "data_entrada" no campo "data_entrada"
        E existe um campo "data_saida" para inserção de data de saída
        E eu insira "data_saida" no campo "data_saida"
        Então eu devo estar em uma página de confirmação com a tabela:

        | data de entrada | dd/mm/aaaa |
        | data de saída   | dd/mm/aaaa |

    # Cenario triste
    Cenário: Usuário envia dados em formato inválido
        Dado que o usuário insere uma data inválida
        Então eu devo ver uma mensagem de erro