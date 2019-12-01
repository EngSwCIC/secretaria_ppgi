#language: pt
 
Funcionalidade: Prazo
    COMO um administrado EU QUERO definir um prazo a partir da home.

    Contexto:
        Dado que meu banco de dados está inicializado

        Cenário: Definir um prazo como um administrador sem modificar os dias e os horários
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Prazos"
            E eu aperto no botão "Novo prazo"
            Quando eu aperto no botão "Criar Prazo"
            Então eu espero ver "Prazo criado com sucesso."

        Cenário: Definir um prazo como administrador modificando o dia
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Prazos"
            E eu aperto no botão "Novo prazo"
            Quando eu seleciono o valor "9" na lista "setup_inicio_3i"
            Quando eu seleciono o valor "24" na lista "setup_fim_3i"
            Quando eu aperto no botão "Criar Prazo"
            Então eu espero ver "Prazo criado com sucesso."

        Cenário: Definir um prazo como administrador modificando o mês
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Prazos"
            E eu aperto no botão "Novo prazo"
            Quando eu seleciono o valor "Janeiro" na lista "setup_inicio_2i"
            Quando eu seleciono o valor "Abril" na lista "setup_fim_2i"
            Quando eu aperto no botão "Criar Prazo"
            Então eu espero ver "Prazo criado com sucesso."

        Cenário: Definir um prazo como administrador modificando o ano
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Prazos"
            E eu aperto no botão "Novo prazo"
            Quando eu seleciono o valor "2019" na lista "setup_inicio_1i"
            Quando eu seleciono o valor "2020" na lista "setup_fim_1i"
            Quando eu aperto no botão "Criar Prazo"
            Então eu espero ver "Prazo criado com sucesso."

        Cenário: Definir um prazo como administrador modificando a hora
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Prazos"
            E eu aperto no botão "Novo prazo"
            Quando eu seleciono o valor "08" na lista "setup_inicio_4i"
            Quando eu seleciono o valor "16" na lista "setup_fim_4i"
            Quando eu aperto no botão "Criar Prazo"
            Então eu espero ver "Prazo criado com sucesso."

        Cenário: Definir um prazo como administrador modificando os minutos
            Dado que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Prazos"
            E eu aperto no botão "Novo prazo"
            Quando eu seleciono o valor "39" na lista "setup_inicio_5i"
            Quando eu seleciono o valor "01" na lista "setup_fim_5i"
            Quando eu aperto no botão "Criar Prazo"
            Então eu espero ver "Prazo criado com sucesso."

        Cenário: Deletar um prazo sendo um administrador
            Dado que meu banco de dados está inicializado com os prazos das solicitações
            E que eu estou na "home" e eu estou logado como "administrador"
            Quando eu aperto no botão "Solicitações"
            E eu aperto no botão "Prazos"
            # E eu aperto no botão "Deletar"
            E eu aperto no botão "Deletar" na linha "1"
            E eu confirmo o popup
            Então eu espero ver "Prazo deletado com sucesso."
