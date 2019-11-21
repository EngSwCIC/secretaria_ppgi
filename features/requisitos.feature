#language: pt

Funcionalidade: Criar um requisito
    COMO um administrado EU QUERO criar um novo requisito a partir da home.

    Cenário: Criar um requisito
        Dado que eu estou na "home" e eu estou logado como "administrador"
        Quando eu clico no link "Requerimentos"
        E eu aperto no botão "Novo requerimento"
        Quando eu preencho o campo "requirement_name" com o valor "Nome"
        Quando eu preencho o campo "requirement_description" com o valor "Nome nome nome"
        E eu aperto no botão "Criar Requirement"
        Então eu espero ver "Requirement was successfully created."
