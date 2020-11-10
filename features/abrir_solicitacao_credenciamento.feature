#language: pt
#encoding: utf-8

Funcionalidade: Solicitar credenciamento
  Como professor autenticado no sistema,
  Quero poder solicitar meu credenciamento
  Para que eu possa ser um professor credenciado

  Contexto:
    Dado que eu esteja cadastrado como usuário "prof1@user.com"
    E que esteja logado
    E que esteja na página de credenciamento
    E esteja pendente de credenciamento

  Cenário: Solicitacao enviada com sucesso
    Quando eu preencher o número do processo SEI
    E clicar no botão "Solicitar credenciamento"
    Então é enviado à administração uma solicitação de credenciamento
    E aparece uma mensagem de confirmação

  Cenário: Solicitacao não enviada - erro no número do processo    
    Quando eu preencher com um número qualquer
    E clicar no botão "Solicitar credenciamento"
    Então a mensagem de erro "Número inválido"

  Cenário: Solicitação não enviada - campo em branco    
    Quando eu não preencher o campo do número do processo SEI
    E clicar no botão "Solicitar credenciamento"
    Então a mensagem de erro "Campo obrigatório em branco"