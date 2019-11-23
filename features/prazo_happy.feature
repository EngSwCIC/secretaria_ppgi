#language: pt
 
Funcionalidade: Prazo
    COMO um administrado EU QUERO definir um prazo a partir da home.

    Contexto:
        Dado que meu banco de dados está inicializado

        Cenário: Definir um prazo como um administrador
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Prazos"
            E eu aperto no botão "Novo prazo"
            Quando eu seleciono o valor "28" na lista "setup_inicio_3i"
            Quando eu seleciono o valor "Dezembro" na lista "setup_inicio_2i"
            Quando eu seleciono o valor "2019" na lista "setup_inicio_1i"
            Quando eu seleciono o valor "07" na lista "setup_inicio_4i"
            Quando eu seleciono o valor "30" na lista "setup_inicio_5i"

            Quando eu seleciono o valor "29" na lista "setup_fim_3i"
            Quando eu seleciono o valor "Dezembro" na lista "setup_fim_2i"
            Quando eu seleciono o valor "2019" na lista "setup_fim_1i"
            Quando eu seleciono o valor "07" na lista "setup_fim_4i"
            Quando eu seleciono o valor "30" na lista "setup_fim_5i"
            Quando eu aperto no botão "Criar Prazo"
            Então eu espero ver "Prazo criado com sucesso."