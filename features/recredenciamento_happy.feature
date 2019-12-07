#language: pt

Funcionalidade: Solicitação de Credenciamento
    COMO um professor EU QUERO abrir uma nova solicitação de credenciamento.

    Contexto: 
        Dado que meu banco de dados está inicializado

        Cenário: Solicitar recredenciamento sendo um professor
            Dado que eu estou na "home" e eu estou logado como "professor"
            Quando eu clico no link "Ver resultado do Credenciamento"
            E eu clico no link "Requisitar Recredenciamento"
            E eu aperto o botão "Pedir Re-Cadastro"
            Então eu espero ver "Seu pedido de recredenciamento está em processo"