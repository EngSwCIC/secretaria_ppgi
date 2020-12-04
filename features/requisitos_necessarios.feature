#language: pt
#encoding: utf-8

Funcionalidade: Disponibilizar os requisitos para o credenciamento
  Como um administrador autenticado no sistema,
  Para que os professores possam abrir solicitações de credenciamento
  Quero poder disponibilizar os requisitos necessários para o credenciamento

  Contexto:
    Dado que eu esteja cadastrado e logado como "Preihs", "preihs@admin.com", "preihs123", "administrator", "200000000"
    E que eu esteja na página de requisitos para o credenciamento

    Cenário: Requisitos modificados com sucesso
      Quando eu clico em 'Adicionar Informação de Requisitos'
      E eu preencho com "Requisitos de Credenciamento" em 'Título'
      E eu anexo o arquivo "features/resources/Formulário de Credenciamento.doc" em 'Documentos'
      E eu aperto 'Enviar'
      Então eu devo receber uma mensagem de sucesso
    
    Cenário: Requisitos não modificados (campo obrigatório em branco)
      Quando eu clico em 'Adicionar Informação de Requisitos'
      E eu anexo o arquivo "features/resources/Formulário de Credenciamento.doc" em 'Documentos'
      E eu aperto 'Enviar'
      Então eu devo receber uma mensagem de erro
    
    Cenário: Requisitos não modificados (registro duplicado)
      Dado que o registro "Requisitos de Credenciamento" já exista na tabela de requisitos
      E que eu esteja na página de requisitos para o credenciamento
      Quando eu clico em 'Adicionar Informação de Requisitos'
      E eu preencho com "Requisitos de Credenciamento" em 'Título'
      E eu aperto 'Enviar'
      Então eu devo receber uma mensagem de erro
