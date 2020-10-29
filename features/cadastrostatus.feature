#language: pt

Funcionalidade: Como um secretário,
    eu gostaria de cadastrar os possíveis status dos processos,
    para que eu possa manter controle do fluxo dos processos 

    Cenário: Cadastrar um Status chamado Novo
    Dado que entrei com login e senha
    E sou secretário
    Quando clicar para cadastrar status de processos
    E cadastrar um status chamado de Novo
    Então sera cadastrado um status de processo chamado de Novo

    Cenario: Cadastrar um Status chamado Em Andamento
    Dado que entrei com login e senha
    E sou secretário
    Quando clicar para cadastrar status de processos
    E cadastrar um status chamado de Em Andamento
    Então será cadastrado um status de processo chamado de Andamento
    
    Cenario: Cadastrar um Status chamado Finalizado
    Dado que entrei com login e senha
    E sou secretário
    Quando clicar para cadastrar status de processos
    E cadastrar um status chamado de Finalizado
    Então será cadastrado um status de processo chamado de Finalizado

    Cenario: Cadastrar um Status que já existe
    Dado que entrei com login e senha
    E sou secretário
    Quando clicar para cadastrar status de processos
    E cadastrar um status com mesmo nome que um Status já existente
    Então acontecerá um erro avisando que o Status já existe