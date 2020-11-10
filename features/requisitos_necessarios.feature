#language: pt
#encoding: utf-8

Funcionalidade: Disponibilizar os requisitos necessarios para credenciamento de professores
  Como administrador autenticado no sistema,
  Quero poder disponibilizar para os professores os requisitos necessários para o credenciamento
  Para que eles possam dar procedimento ao credenciamento

  Contexto:
    Dado que eu esteja logado como administrador de email "gp@admin.com" e senha "123"
    E não existem requisitos selecionados na página principal
    Quando o administrador clicou no link para alterar documentos necessários para credenciamento

    Cenário: Os campos puderam ser selecionados
      Quando eu selecionar os campos
      E eu clicar no botão atualizar requisitos
      Então eu devo voltar para a página principal aonde aparece meus requisitos selecionados

    Cenário: Não houveram mudanças feitas 
      Quando eu não selecionar os campos
      E eu clicar no botão atualizar requisitos
      Então eu recebo uma mensagem dizendo que "não houveram mudanças"
