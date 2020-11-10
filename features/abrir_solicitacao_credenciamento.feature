#language: pt
#encoding: utf-8

Funcionalidade: Abrir solicitação de credenciamento
    Como professor autenticado no sistema,
    Quero poder abrir uma solicitação de credenciamento
    Para que eu possa ser um professor credenciado

    Contexto:
        Dado que eu estou cadastrado e logado como "Lucas", "lucas@professor.com", "lucas123", "professor", "200000000"
        E que eu estou na página de abrir solicitação de credenciamento

    Cenário: Solicitação enviada com sucesso
        Quando eu anexo o arquivo "Formulário de Credenciamento.pdf" no campo 'Formulario'
        E eu anexo o arquivo "CV Lattes.pdf" em 'CV Lattes'
        E eu clico em 'Enviar'
        Então eu devo ver "Solicitação enviada com sucesso"

    Cenário: Solicitação não enviada (campo obrigatório em branco)
        Quando eu anexo o arquivo "Formulário de Credenciamento.pdf" no campo 'Formulario'
        E eu clico em 'Enviar'
        Então eu devo ver "Solicitação não enviada (campo obrigatório* em branco)"