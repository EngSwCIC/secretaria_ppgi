#language: pt
#encoding: utf-8

Funcionalidade: Gerenciar solicitações de credenciamento
    Como um admnistrador do sistema
    Quero visualizar uma solicitação de credencimento em aberto
    Para decidir se vou aceitar ou recusar tal solicitação

    Contexto:
        Dado que os seguintes solicitações estejam pendentes:
        | title         | due_date    | activity_type_id |
        | Solicitação 1 | 02-Jan-2021 | 1                |
        | Solicitação 2 | 02-Jan-2021 | 1                |
        | Solicitação 3 | 02-Jan-2021 | 1                |
        | Solicitação 4 | 02-Jan-2021 | 1                |
        
        E que eu estou cadastrado como "Gabriel", "gabriel@admin.com", "gabriel123", "administrador", "200000000"
        E que eu estou logado
        E que eu estou na página de solicitações de credenciamento
    
    Cenário: Aceitar uma solicitação de credenciamento
        Quando eu clico em "Solicitação 1"
        Então eu devo estar na página da "Solicitação 1"
        Quando eu clico em "Aceitar"
        Então eu devo estar na página de solicitações de credenciamento
        E eu não devo ver "Solicitação 1"
        Quando eu clico em "Solicitações aceitas"
        Então eu devo ver "Solicitação 1"
    
    Cenário: Recusar uma solicitação de credenciamento
        Quando eu clico em "Solicitação 2"
        Então eu devo estar na página da "Solicitação 2"
        Quando eu clico em "Recusar"
        Então eu devo estar na página de solicitações de credenciamento
        E eu não devo ver "Solicitação 2"
        Quando eu clico em "Solicitações aceitas"
        Então eu não devo ver "Solicitação 2"
