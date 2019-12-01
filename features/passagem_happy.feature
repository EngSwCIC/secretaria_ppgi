#language: pt

Funcionalidade: Passagens
    COMO um usuário EU QUERO solicitar passagens aéreas para receber o benefício.

    Contexto: 
        Dado que meu banco de dados está inicializado

        Cenário: Solicitar o benefício de passagem sendo um estudante sem informar a data
            Dado que eu estou na "home" e eu estou logado como "estudante"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Nova Solicitação"
            Quando eu seleciono o valor "Passagem" na lista "solicitation_kind"
            E eu preencho o campo "solicitation_origin" com o valor "Brasília"
            E eu preencho o campo "solicitation_destination" com o valor "Disney"
            E eu preencho o campo "solicitation_description" com o valor "AAAAAAAAAAAa"
            E eu aperto no botão "Criar Solicitação"
            Então eu espero ver "Solicitação criada com sucesso."

        Cenário: Solicitar o benefício de passagem sendo um professor sem informar a data
            Dado que eu estou na "home" e eu estou logado como "professor"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Nova Solicitação"
            Quando eu seleciono o valor "Passagem" na lista "solicitation_kind"
            E eu preencho o campo "solicitation_origin" com o valor "Brasília"
            E eu preencho o campo "solicitation_destination" com o valor "Disney"
            E eu preencho o campo "solicitation_description" com o valor "AAAAAAAAAAAa"
            E eu aperto no botão "Criar Solicitação"
            Então eu espero ver "Solicitação criada com sucesso."

        Cenário: Solicitar o benefício de passagem sendo um secretário sem informar a data
            Dado que eu estou na "home" e eu estou logado como "secretário"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Nova Solicitação"
            Quando eu seleciono o valor "Passagem" na lista "solicitation_kind"
            E eu preencho o campo "solicitation_origin" com o valor "Brasília"
            E eu preencho o campo "solicitation_destination" com o valor "Disney"
            E eu preencho o campo "solicitation_description" com o valor "AAAAAAAAAAAa"
            E eu aperto no botão "Criar Solicitação"
            Então eu espero ver "Solicitação criada com sucesso."
