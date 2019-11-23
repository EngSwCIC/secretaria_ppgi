#language: pt
 
Funcionalidade: Prazo
    COMO um administrado EU QUERO definir um prazo a partir da home.

    Contexto:
        Dado que meu banco de dados está inicializado

        Cenário: Definir um prazo como um usuário
            Dado que eu estou na "home" 
            Então eu não espero ver "Solicitações"

        Cenário: Definir um prazo como um professor
            Dado que eu estou na "home" e eu estou logado como "professor"
            Quando eu aperto no botão "Solicitações"
            Então eu não espero ver "Nova Solicitação"
            E eu não espero ver "Definir prazo para criar solicitações"

        Cenário: Definir um prazo como um estudante
            Dado que eu estou na "home" e eu estou logado como "estudante"
            Quando eu aperto no botão "Solicitações"
            Então eu não espero ver "Nova Solicitação"
            E eu não espero ver "Definir prazo para criar solicitações"

        Cenário: Definir um prazo como um secretário
            Dado que eu estou na "home" e eu estou logado como "secretário"
            Quando eu aperto no botão "Solicitações"
            Então eu não espero ver "Nova Solicitação"
            E eu não espero ver "Definir prazo para criar solicitações"