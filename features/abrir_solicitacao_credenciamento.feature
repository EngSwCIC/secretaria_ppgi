#language: pt
#encoding: utf-8

Funcionalidade: Abrir solicitação de credenciamento
    Como um professor autenticado no sistema,
    Quero poder abrir uma solicitação de credenciamento
    Para que eu possa ser um professor credenciado

    Contexto:
        Dado que eu esteja cadastrado e logado como "Lucas", "lucas@professor.com", "lucas123", "professor", "200000000"
        E que eu esteja na página de solicitações de credenciamento
        Quando eu clico em 'Abrir Novo Processo'

    Cenário: Solicitação enviada com sucesso
        Quando eu anexo o arquivo "features/resources/Formulário de Credenciamento.doc" em 'Documentos'
        E eu anexo o arquivo "features/resources/ship.jpg" em 'Documentos'
        E eu aperto 'Enviar'
        Então eu devo receber uma mensagem de sucesso

    Cenário: Solicitação não enviada (campo obrigatório em branco)
        Quando eu aperto 'Enviar'
        Então eu devo receber uma mensagem de erro
