#language: pt
 
Funcionalidade: Criar um requisito
    COMO um administrado EU QUERO criar um novo requisito a partir da home.

    Contexto:
        Dado que meu banco de dados está inicializado

        Cenário: Criar um requisito com administrador sem preencher o campo de nome e descrição
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Requerimentos"
            E eu aperto no botão "Novo requerimento"
            Quando eu não preencho o campo "requirement_name" 
            Quando eu não preencho o campo "requirement_description" 
            E eu aperto no botão "Criar Requerimento"
            Então eu espero ver "Name não pode ficar em branco"
            E   eu espero ver "Description não pode ficar em branco"

        Cenário: Criar um requisito com administrador sem preencher o campo de descrição
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Requerimentos"
            E eu aperto no botão "Novo requerimento"
            Quando eu preencho o campo "requirement_name" com o valor "Nome"
            Quando eu não preencho o campo "requirement_description" 
            E eu aperto no botão "Criar Requerimento"
            Então eu espero ver "Description não pode ficar em branco"

        Cenário: Criar um requisito como administrador sem preencher o campo de nome
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Requerimentos"
            E eu aperto no botão "Novo requerimento"
            Quando eu não preencho o campo "requirement_name" 
            Quando eu preencho o campo "requirement_description" com o valor "Nome nome nome"
            E eu aperto no botão "Criar Requerimento"
            Então eu espero ver "Name não pode ficar em branco"

        Cenário: Criar um novo requerimento como usuário
            Dado que eu estou na "home" 
            Quando eu aperto no botão "Requerimentos"
            Então eu não espero ver "Novo requerimento"

        Cenário: Criar um novo requerimento como professor
            Dado que eu estou na "home" e eu estou logado como "professor"
            Quando eu aperto no botão "Requerimentos"
            Então eu não espero ver "Novo requerimento"

        Cenário: Criar um novo requerimento como estudante
            Dado que eu estou na "home" e eu estou logado como "estudante"
            Quando eu aperto no botão "Requerimentos"
            Então eu não espero ver "Novo requerimento"

        Cenário: Criar um novo requerimento como secretário
            Dado que eu estou na "home" e eu estou logado como "secretário"
            Quando eu aperto no botão "Requerimentos"
            Então eu não espero ver "Novo requerimento"
