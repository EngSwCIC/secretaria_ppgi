#language: pt

Funcionalidade: Solicitação de Credenciamento
    COMO um professor EU QUERO abrir uma solicitação de credenciamento.

    Contexto: 
        Dado que meu banco de dados está inicializado

        Cenário: Solicitar credenciamento sendo um professor
            Dado que eu estou na "home" e eu estou logado como "professor"
            Quando eu aperto no botão "Fazer pedido de Credenciamento"
            e aperto no botão "Pedir Cadastro"
            Então eu espero ver a "home"
            E eu espero ver "Seu pedido de credenciamento está em processo"