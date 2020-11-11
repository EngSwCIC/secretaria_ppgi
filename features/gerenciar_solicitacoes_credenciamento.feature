#language: pt
#encoding: utf-8

Funcionalidade: Gerenciar solicitações de credenciamento
    Como um admnistrador autenticado no sistema,
    Quero visualizar uma solicitação de credencimento em aberto
    Para decidir se vou aceitar ou recusar tal solicitação

    Contexto:
        Dado que existam as seguintes solicitações:
        | title         | activity_type_title           |
        | Solicitação 1 | Solicitação de credenciamento |
        | Solicitação 2 | Solicitação de credenciamento |
        | Solicitação 3 | Solicitação de credenciamento |
        | Solicitação 4 | Solicitação de credenciamento |

        E que eu esteja cadastrado e logado como "Gabriel", "gabriel@admin.com", "gabriel123", "administrator", "200000000"
        E que eu esteja na página de solicitações de credenciamento
    
    Cenário: Aceitar uma solicitação de credenciamento
        Quando eu clico em "Solicitação 1"
        Então eu devo estar na página de "Solicitação 1"
        Quando eu clico em 'Aprovar'
        Então eu devo estar na página de solicitações de credenciamento
        Quando eu desmarco os seguintes estados: Rejeitadas, Reformulação
        E eu marco os seguintes estados: Aprovadas
        E eu aperto 'Atualizar'
        Então eu devo ver "Solicitação 1"
    
    Cenário: Recusar uma solicitação de credenciamento
        Quando eu clico em "Solicitação 2"
        Então eu devo estar na página de "Solicitação 2"
        Quando eu clico em 'Rejeitar'
        Então eu devo estar na página de solicitações de credenciamento
        Quando eu desmarco os seguintes estados: Aprovadas, Reformulação
        E eu marco os seguintes estados: Rejeitadas
        E eu aperto 'Atualizar'
        Então eu devo ver "Solicitação 2"
