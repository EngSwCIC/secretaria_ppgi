#language: pt

Funcionalidade: Criar um requisito
    COMO um administrado EU QUERO criar um novo requisito a partir da home.

    Contexto:
        Dado que meu banco de dados está inicializado


        Cenário: Criar um requisito como um administrador
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Requerimentos"
            Quando eu aperto no botão "Novo requerimento"
            E eu preencho o campo "requirement_name" com o valor "Nome"
            E eu preencho o campo "requirement_description" com o valor "Nome nome nome"
            Quando eu aperto no botão "Criar Requerimento"
            Então eu espero ver "Requerimento criado com sucesso."

        Cenário: Ver um requisito que eu criei como um administrador
            Dado que eu criei um requisito com o nome "Nome" e com o valor "Nome nome nome" como administrador
            E que eu estou na "home"
            Quando eu aperto no botão "Requerimentos"
            Então eu espero ver "Nome"
            E eu espero ver "Nome nome nome"

        Cenário: Vizualizar os requisitos como um usuário
            Dado que eu estou na "home"
            Quando eu aperto no botão "Requerimentos"
            Então eu espero ver "Nome"
            E eu espero ver "Nome nome nome nome"

        Cenário: Vizualizar os requisitos como um estudante
            Dado que eu estou na "home" e eu estou logado como "estudante"
            Quando eu aperto no botão "Requerimentos"
            Então eu espero ver "Nome"
            E eu espero ver "Nome nome nome nome"

        Cenário: Vizualizar os requisitos como um professor
            Dado que eu estou na "home" e eu estou logado como "professor"
            Quando eu aperto no botão "Requerimentos"
            Então eu espero ver "Nome"
            E eu espero ver "Nome nome nome nome"

        Cenário: Vizualizar os requisitos como um secretário
            Dado que eu estou na "home" e eu estou logado como "secretário"
            Quando eu aperto no botão "Requerimentos"
            Então eu espero ver "Nome"
            E eu espero ver "Nome nome nome nome"

        Cenário: Vizualizar os requisitos como um administrador
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Requerimentos"
            Então eu espero ver "Nome"
            E eu espero ver "Nome nome nome nome"


        Cenário: Editar os requisitos como administrador
            Dado que eu estou na "página de requerimentos" e eu estou logado como "administrador"
            E eu aperto no botão "Editar"
            E eu preencho o campo "requirement_name" com o valor "Dora a Aventureira"
            Quando eu aperto no botão "Atualizar Requerimento"
            Então eu espero ver "Requerimento atualizado com sucesso."

        Cenário: Deletar os requisitos como administrador
            Dado que eu estou na "página de requerimentos" e eu estou logado como "administrador"
            E eu aperto no botão "Deletar"
            E eu confirmo o popup
            Então eu espero ver "Requerimento deletado com sucesso."