#language: pt

Funcionalidade: Prazo de Credenciamento
    COMO um administrador EU QUERO definir o período de credenciamento dos professores.

    Contexto: 
        Dado que meu banco de dados está inicializado

        Cenário: Criar prazo de credenciamento sendo um administrador definindo a data
            Dado que eu estou na "home" e eu estou logado como "admin"
            Quando eu aperto no botão "Criar Periodo de Credenciamento"
            Quando eu seleciono o valor "Data de Começo"
            E eu seleciono o valor "Data Final"
            E eu aperto no botão "Criar Novo Periodo"
            Então eu espero ver "Período agendado com sucesso."