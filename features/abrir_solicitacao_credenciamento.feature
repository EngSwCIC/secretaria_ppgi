#language: pt
#encoding: utf-8

Funcionalidade: Abrir solicitação de credenciamento
    Como um professor autenticado no sistema,
    Quero poder abrir uma solicitação de credenciamento
    Para que eu possa ser um professor credenciado

    Contexto:
        Dado que eu esteja cadastrado e logado como "Lucas", "lucas@professor.com", "lucas123", "professor", "200000000"
        E que eu esteja na página de abrir solicitação de credenciamento

    Cenário: Solicitação enviada com sucesso
        Quando eu anexo o arquivo "Formulário de Credenciamento.pdf" em 'Formulario'
        E eu anexo o arquivo "CV Lattes.pdf" em 'CV Lattes'
        E eu aperto 'Enviar'
        Então eu devo ver "Solicitação enviada com sucesso"

    Cenário: Solicitação não enviada (campo obrigatório em branco)
        Quando eu anexo o arquivo "Formulário de Credenciamento.pdf" em 'Formulario'
        E eu aperto 'Enviar'
        Então eu devo ver "Solicitação não enviada (campo obrigatório* em branco)"