#language: pt

Funcionalidade: Como um secretário,
    eu gostaria de cadastrar os possíveis status dos processos,
    para que eu possa manter controle do fluxo dos processos 

    Contexto: Faço login como secretário
    Dado que estou estou na página de secretário
    E clico em "Cadastrar um Status"

    Cenário: Cadastrar um Status (caminho feliz)
    Dado que estou na pagina de cadastrar um status
    Quando preencher em "Nome do Status:" com "Novo"
    E seleciono "Média" em "Urgência:"
    E clicar em "Concluir"
    Então deveria estar de volta na pagina de cadastrar um status
    E deveria aparecer "Status Cadastrado com sucesso!"

    Cenario: Cadastrar um Status (caminho triste)
    Dado que estou na pagina de cadastrar um status
    Quando preencher em "Nome do Status:" com "Novo"
    E clicar em "Concluir"
    Então deveria estar de volta na pagina de secretário
    E deveria aparecer "Erro ao Cadastrar Status!"
    