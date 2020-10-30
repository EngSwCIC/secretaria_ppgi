#language: pt

Funcionalidade: Filtrar processos por pessoa
    
    Como um secretário, para que eu possa ter informações durante um atendimento,
    eu gostaria de ver todos os processos relacionados a uma pessoa

    Contexto: Faço login como secretário
    Dado que estou estou na página de secretário
    E clico em "Consultar Processos" para ser direcionado 
    ao campo "Nome do

    Cenário: Nome da pessoa não consta no sistema
        Dado um processo existente
        Quando adiciono um arquivo 'file.pdf' ao processo
        Então o processo deve constar com o novo arquivo 'file.pdf'
    
    Cenário: Pessoa sem processos registrados
        Dado um processo existente
        Quando adiciono um arquivo 'file.exe' ao processo
        Então o processo não deve constar o novo arquivo 'file.exe'

