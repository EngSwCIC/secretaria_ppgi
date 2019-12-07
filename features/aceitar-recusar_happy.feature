#language: pt

Funcionalidade: Avaliar de Credenciamento
    COMO um administrador EU QUERO aceitar ou recusar o credenciamento dos professores.

    Contexto: 
        Dado que meu banco de dados está inicializado

        Cenário: Aceitar credenciamento sendo um administrador
            Dado que eu estou na "home" e eu estou logado como "admin"
            Quando eu clico no link "Lista de Pedidos de Credenciamento"
            Quando eu clico no link "Approve?"
            Então eu espero ver "Pedido aprovado."

        Cenário: Rejeitar credenciamento sendo um administrador
            Dado que eu estou na "home" e eu estou logado como "admin"
            Quando eu clico no link "Lista de Pedidos de Credenciamento"
            Quando eu clico no link "Reprove?"
            Então eu espero ver "Pedido reprovado."