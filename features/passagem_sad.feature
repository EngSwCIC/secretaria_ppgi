#language: pt

Funcionalidade: Passagem
    COMO um usuário EU QUERO solicitar passagens aéreas para receber o benefício.

    Contexto: 
        Dado que meu banco de dados está inicializado

        Cenário: Solicitar o benefício de passagens sendo um estudante sem informar a data, destino e descrição
            Dado que eu estou na "home" e eu estou logado como "estudante"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Nova Solicitação"
            Quando eu seleciono o valor "Passagem" na lista "solicitation_kind"
            E eu preencho o campo "solicitation_origin" com o valor "Brasília"
            E eu aperto no botão "Criar Solicitação"
            Então eu espero ver "Destination não pode ficar em branco"
            E eu espero ver "Description não pode ficar em branco"

        Cenário: Solicitar o benefício de passagens sendo um estudante sem informar a data, origem, destino e descrição
            Dado que eu estou na "home" e eu estou logado como "estudante"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Nova Solicitação"
            Quando eu seleciono o valor "Passagem" na lista "solicitation_kind"
            E eu aperto no botão "Criar Solicitação"
            Então eu espero ver "Destination não pode ficar em branco"
            E eu espero ver "Description não pode ficar em branco"
            E eu espero ver "Origin não pode ficar em branco"

        Cenário: Solicitar o benefício de passagens sendo um estudante sem informar a data, origem e descrição
            Dado que eu estou na "home" e eu estou logado como "estudante"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Nova Solicitação"
            Quando eu seleciono o valor "Passagem" na lista "solicitation_kind"
            E eu preencho o campo "solicitation_destination" com o valor "Disney"
            E eu aperto no botão "Criar Solicitação"
            Então eu espero ver "Description não pode ficar em branco"
            E eu espero ver "Origin não pode ficar em branco"

        Cenário: Solicitar o benefício de passagens sendo um estudante sem informar a data, origem e destino
            Dado que eu estou na "home" e eu estou logado como "estudante"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Nova Solicitação"
            Quando eu seleciono o valor "Passagem" na lista "solicitation_kind"
            E eu preencho o campo "solicitation_description" com o valor "AAAAAAAAAAAa"
            E eu aperto no botão "Criar Solicitação"
            Então eu espero ver "Destination não pode ficar em branco"
            E eu espero ver "Origin não pode ficar em branco"
