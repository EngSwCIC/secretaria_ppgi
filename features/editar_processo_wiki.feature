
#language: pt
#encoding: utf-8

Funcionalidade: Editar processo de atendimento
  Como um secretário cadastrado, 
  para que eu possa manter a Wiki atualizada, 
  eu gostaria de editar um processo de atendimento já cadastrado

  Contexto:
    Dado que eu esteja cadastrado como usuario "user@user.com", "123456", "secretario",
    E que esteja na pagina da wiki de atendimento
    E eu seleciono um processo
    E eu clico no botão "Editar processo"

  Cenário: Campos com informações do processo
    E existe informações "número SEI", "nome/tipo do processo", "nome dos envolvidos no processo" e "status" cadastradas
    Quando eu seleciono um campo
    Então devo editar as informações do campo