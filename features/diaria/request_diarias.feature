#language:pt

Funcionalidade: Realizar solicitação de diárias para um período
    Como um usuário
    Para que eu possa receber o auxílio
    Eu gostaria de fazer uma solicitação de diárias para um período

    Contexto: 
        Dado que eu esteja cadastrado como usuario "student@student.com"
        E que eu esteja autenticado com o email "student@student.com" e a senha "admin123" 2
        E que esteja na página inicial
        E eu clicar no botão Solicitar diárias

    Cenário: A solicitação de passagens é bem sucedida
        Dado que eu insira data de entrada "00/00/0000"
        E que eu insira data de saida "00/00/0000"
        E que eu clique no botão de 'Create Diarium'
        Então eu devo estar em uma página de confirmação

    # Cenario triste
    Cenário: Usuário envia dados em formato inválido
        Dado que o usuário insere uma data inválida "00/00/0000"
        Então eu devo ver uma mensagem de erro