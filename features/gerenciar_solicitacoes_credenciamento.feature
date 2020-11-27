#language: pt
#encoding: utf-8

Funcionalidade: Gerenciar solicitações de credenciamento
    Como um admnistrador autenticado no sistema,
    Quero visualizar uma solicitação de credencimento em aberto
    Para decidir se vou aceitar ou recusar tal solicitação

    Contexto:
        Dado que existam as seguintes solicitações:
        | user_full_name | status |
        | Dave           | Espera |
        | Alvin          | Espera |
        | Simon          | Espera |
        | Theodore       | Espera |

        E que eu esteja cadastrado e logado como "Gabriel", "gabriel@admin.com", "gabriel123", "administrator", "200000000"
        E que eu esteja na página de solicitações de credenciamento
    
    Cenário: Aceitar uma solicitação de credenciamento
        Quando eu escolho avaliar "Dave"
        E eu escolho 'Aprovado'
        E eu aperto 'Enviar'
        Então eu devo estar na página de solicitações de credenciamento
        Quando eu marco apenas os seguintes estados: Aprovado
        E eu aperto 'Atualizar'
        Então eu devo ver "Dave"

    Cenário: Aceitar uma solicitação e encontrar o credenciamento correspondente
        Quando eu escolho avaliar "Alvin"
        E eu escolho 'Aprovado'
        E eu aperto 'Enviar'
        Dado que eu esteja na página de credenciamentos
        Então eu devo ver "Alvin"
    
    Cenário: Recusar uma solicitação de credenciamento
        Quando eu escolho avaliar "Simon"
        E eu escolho 'Rejeitado'
        E eu aperto 'Enviar'
        Então eu devo estar na página de solicitações de credenciamento
        Quando eu marco apenas os seguintes estados: Rejeitado
        E eu aperto 'Atualizar'
        Então eu devo ver "Simon"

    Cenário: Recusar uma solicitação e não encontrar o credenciamento correspondente
        Quando eu escolho avaliar "Theodore"
        E eu escolho 'Rejeitado'
        E eu aperto 'Enviar'
        Dado que eu esteja na página de credenciamentos
        Então eu não devo ver "Theodore"
