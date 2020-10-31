#language: pt

Funcionalidade: Filtrar processos por pessoa
    
    Como um secretário, para que eu possa ter informações durante um atendimento,
    eu gostaria de ver todos os processos relacionados a uma pessoa

    Contexto: Faço login como secretário
    Dado que estou estou na página de secretário
    E clico em "Consultar Processos" para ser direcionado 
    ao campo "Nome do Envolvido"

    Cenário: Nome da pessoa não consta no sistema
        Dado uma busca por nome
        Quando pesquiso uma pessoa específica
        Então deve surgir o aviso de que este nome não está no banco de dados
    
    Cenário: Pessoa sem processos registrados
        Dado uma busca por nome
        Quando pesquiso uma pessoa específica
        Então deve surgir o aviso de que este nome não contém processos registrados