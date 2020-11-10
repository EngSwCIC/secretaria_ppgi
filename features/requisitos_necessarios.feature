#language: pt
#encoding: utf-8

Funcionalidade: Disponibilizar os requisitos para o credenciamento
  Como um administrador autenticado no sistema,
  Para que os professores possam abrir solicitações de credenciamento
  Quero poder disponibilizar os requisitos necessários para o credenciamento

  Contexto:
    Dado que eu esteja cadastrado e logado como "Preihs", "preihs@admin.com", "preihs123", "administrator", "200000000"
    E que eu esteja na página de requisitos para o credenciamento

    Cenário: Modificar os requisitos necessários para o credenciamento
      Quando eu preencho em 'Requisitos' com
      """
      - Formulário de solicitação preenchido e assinado pelo interessado*
      - CV Lattes do coorientador* (apenas dados de publicação dos últimos 5 anos)
      - Cópia do passaporte (apenas caso de orientador/coorientador estrangeiro)
      """
      E eu anexo o arquivo "Formulário de Credenciamento.doc" no campo 'Formulario'
      E eu aperto 'Enviar'
      Então eu devo ver "Requisitos atualizados com sucesso"
