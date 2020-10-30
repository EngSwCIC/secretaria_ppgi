#language: pt

Funcionalidade: Cadastrar um novo processo na Wiki de atendimento

    COMO um secretario EU QUERO cadastrar um novo processo na Wiki de atendimento A FIM de disponibilizar informações para outros secretários.

    Contexto:
        Dado que eu esteja logado como secretario "usuario_secretario@secretario.com", "123456",
        E que esteja na página de atendimento da Wiki
    
    Cenário: Cadastrar um novo processo na Wiki de atendimento(caminho feliz)
        Quando eu clicar "Adicionar processo"
        Então eu devo estar na pagina Criar Novo processo
        Quando eu preencher "numero SEI", "nome/tipo do processo", "nome dos envolvidos no processo", "status"
        E eu clicar em "Criar Processo"
        Então eu devo estar na página de atendimento
        E eu devo ver o Processo de "Numero do processo"