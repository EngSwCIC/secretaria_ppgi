#language: pt

Funcionalidade: Cadastrar um novo processo na Wiki de atendimento

    COMO um secretario 
    EU QUERO cadastrar um novo processo na Wiki de atendimento 
    A FIM de disponibilizar informações para outros secretários.

    Contexto:
        Dado que eu esteja conectado como usuario "usuario_secretario@secretario.com", "123456", "secretario"
        E que esteja na página "processos de atendimento"
        E clico no botão "Adicionar processo"

    Cenário: Preenche campos com informações válidas(caminho feliz)
        Quando eu preencho o campo "número SEI" com "0423-123456/2017"
        E preencho o campo "reponsável" com "Genaína Rodrigues"
        E seleciono o "status" "em andamento"
        E clico no botão "Confirmar"
        Então sou redirecionado para a página "processos de atendimento"
        E recebo uma mensagem de sucesso

    Cenário: Preenche campos com informações inválidas
        Quando eu preencho o campo "número SEI" com "alilicece"
        E clico no botão "Confirmar"
        Então recebo uma mensagem de erro