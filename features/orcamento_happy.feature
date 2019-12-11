#language: pt

Funcionalidade: Orçamento
    COMO um usuário EU QUERO ultizar as Funcionalidades do orçamento

    Contexto:
        Dado que meu banco de dados está inicializado
        E que meu banco de dados está inicializado com os prazos das solicitações

    Cenário: Adicionar um orçamento
        Dado que eu estou na "página de orçamentos" e eu estou logado como "administrador"
        Quando eu aperto no botão "Nova Movimentação"
        E eu preencho o campo "log_value" com o valor "3000.0"
        E eu preencho o campo "log_description" com o valor "Tá na Disney"
        E eu aperto no botão "Criar Movimentação"
        Então eu espero ver "Movimentação criada com sucesso."

    Cenário: Editar um orçamento
        Dado que eu estou na "página de orçamentos" e eu estou logado como "administrador"
        Quando eu aperto no botão "Editar" na linha "1"
        E eu preencho o campo "log_value" com o valor "30.0"
        E eu aperto no botão "Atualizar Movimentação"
        Então eu espero ver "Movimentação atualizada com sucesso."

    Cenário: Deletar um orçamento
        Dado que eu estou na "página de orçamentos" e eu estou logado como "administrador"
        Quando eu aperto no botão "Deletar" na linha "1"
        Então eu espero ver "Movimentação deletada com sucesso."

    Cenário: Ver um botão orçamento
        Dado que eu estou na "home" e eu estou logado como "administrador"
        Então eu espero ver o botão "Ver orçamento"

    Cenário: Não ver um botão orçamento
        Dado que eu estou na "home" e eu estou logado como "administrador"
        Então eu não espero ver o botão "Ver orçamento"

    Cenário: Reprovar uma solicitação
        Dado que eu estou na "página de solicitações" e eu estou logado como "administrador"
        E eu aperto no botão "Reprovar" na linha "1"
        Então eu espero ver "Solicitação reprovada com sucesso."

    Cenário: Aprovar uma solicitação
        Dado que eu estou logado como "administrador"
        E que eu tenha "2000" de orçamento
        E que eu estou na "página de solicitações"
        E eu aperto no botão "Aprovar" na linha "1"
        Então eu espero ver "Solicitação aprovada com sucesso."

    Cenário: Aprovar uma solicitação
        Dado que eu estou logado como "administrador"
        E que eu tenha "2000" de orçamento
        E que eu estou na "página de solicitações"
        E eu aperto no botão "Aprovar" na linha "2"
        Então eu espero ver "Solicitação aprovada com sucesso."

    Cenário: Aprovar uma solicitação
        Dado que eu estou logado como "administrador"
        E que eu tenha "2000" de orçamento
        E que eu estou na "página de solicitações"
        E eu aperto no botão "Aprovar" na linha "1"
        Quando eu vou para "página de orçamentos"
        Então eu espero ver "-2000"

    Cenário: Aprovar uma solicitação
        Dado que eu estou logado como "administrador"
        E que eu tenha "2000" de orçamento
        E que eu estou na "página de solicitações"
        E eu aperto no botão "Aprovar" na linha "2"
        Quando eu vou para "página de orçamentos"
        Então eu espero ver "-800"

