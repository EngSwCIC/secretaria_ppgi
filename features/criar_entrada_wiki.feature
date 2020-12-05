#language: pt

Funcionalidade: Cadastrar um novo processo na Wiki de atendimento

    COMO um secretario 
    EU QUERO cadastrar um novo processo na Wiki de atendimento 
    A FIM de disponibilizar informações para outros secretários.

    Contexto:
        Dado que eu esteja conectado como usuario "secretary@secretary.com", "admin123", "secretary"
        E que esteja na página "Wiki de Atendimento"
        E clico no botão "Adicionar processo"

    Cenário: Preenche campos com informações válidas(caminho feliz)
        Quando eu preencho o campo "Título" com "Trancar Semestre"
        E preencho o campo "Conteúdo" com "Como fazer para trancar o semestre"
        E clico no botão "Confirmar"
        Então sou redirecionado para a página "Processo"
        E recebo uma mensagem de sucesso

    Cenário: Preenche campos com informações inválidas
        Quando eu preencho o campo "Título" com "Trancar Semestre"
        E clico no botão "Confirmar"
        Então recebo uma mensagem de erro