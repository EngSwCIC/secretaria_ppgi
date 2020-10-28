
#language: pt
#encoding: utf-8

Funcionalidade: Adicionar comentário a um processo de atendimento
  Como um secretário, 
  para que eu possa adicionar informações a um processo de atendimento, 
  sem alterar o conteúdo original, 
  eu gostaria de adicionar um comentário nesse processo de atendimento.

  Contexto:
    Dado que eu esteja cadastrado como usuario "user@user.com", "123456", "secretario",
    E que esteja na pagina da wiki de atendimento
    E eu seleciono um processo
    E eu clico no campo "Comentário"
    Então devo adicionar um comentário ao processo

  Cenário: Campos com informações do processo
    E existe o campo "Comentário"
    Quando seleciono o campo "Comentário"
    Então devo adicionar um comentário