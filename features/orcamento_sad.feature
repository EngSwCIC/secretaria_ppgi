#language: pt

Funcionalidade: Orçamentos
    COMO um usuário EU QUERO solicitar diárias para receber o benefício.

    Contexto: 
        Dado que meu banco de dados está inicializado
        E que meu banco de dados está inicializado com os prazos das solicitações

        Cenário: Aprovar uma solicitação
            Dado que eu estou logado como "administrador"
            E que eu tenha "500" de orçamento
            E que eu estou na "página de solicitações"
            Quando eu clico no link "Aprovar" na linha "1"
            E eu confirmo o popup
            Então eu espero ver "Orçamento insuficiente para realizar operação."

        Cenário: Aprovar uma solicitação
            Dado que eu estou logado como "administrador"
            E que eu tenha "200" de orçamento
            E que eu estou na "página de solicitações"
            Quando eu clico no link "Aprovar" na linha "2"
            E eu confirmo o popup
            Então eu espero ver "Orçamento insuficiente para realizar operação."

        Cenário: Adicionar um orçamento sem o campo value
            Dado que eu estou na "página de orçamentos" e eu estou logado como "administrador"
            Quando eu aperto no botão "Nova Movimentação"
            E eu preencho o campo "log_description" com o valor "Tá na Disney"
            E eu aperto no botão "Criar Movimentação"
            Então eu não espero ver "Log was successfully created."

        Cenário: Adicionar um orçamento sem o campo decription
            Dado que eu estou na "página de orçamentos" e eu estou logado como "administrador"
            Quando eu aperto no botão "Nova Movimentação"
            E eu preencho o campo "log_value" com o valor "3000.0"
            E eu aperto no botão "Criar Movimentação"
            Então eu não espero ver "Log was successfully created."
