#language: pt
#encoding: utf-8

Funcionalidade: Gerenciar solicitações de credenciamento
    Como um admnistrador autenticado no sistema,
    Quero visualizar uma solicitação de credencimento em aberto
    Para decidir se vou aceitar ou recusar tal solicitação

    Contexto:
        Dado que existam as seguintes solicitações:
        | user_full_name | status |
        | Adalberto      | Espera |
        | Mariano        | Espera |
        | Joel           | Espera |

        E que eu esteja cadastrado e logado como "Gabriel", "gabriel@admin.com", "gabriel123", "administrator", "200000000"
        E que eu esteja na página de solicitações de credenciamento
    
    Cenário: Aceitar uma solicitação de credenciamento
        Quando eu clico em "Adalberto"
        Então eu devo estar na página de "Adalberto"
        Quando eu clico em 'Aprovar'
        Então eu devo estar na página de solicitações de credenciamento
        Quando eu desmarco os seguintes estados: Rejeitadas, Reformulação
        E eu marco os seguintes estados: Aprovadas
        E eu aperto 'Atualizar'
        Então eu devo ver "Solicitação 1"
    
    Cenário: Recusar uma solicitação de credenciamento
        Quando eu clico em "Mariano"
        Então eu devo estar na página de "Mariano"
        Quando eu clico em 'Rejeitar'
        Então eu devo estar na página de solicitações de credenciamento
        Quando eu desmarco os seguintes estados: Aprovadas, Reformulação
        E eu marco os seguintes estados: Rejeitadas
        E eu aperto 'Atualizar'
        Então eu devo ver "Mariano"
