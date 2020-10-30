
#language: pt
#encoding: utf-8

Funcionalidade: Adicionar comentário a um processo de atendimento
  Como um secretário, 
  para que eu possa adicionar informações a um processo de atendimento, 
  sem alterar o conteúdo original, 
  eu gostaria de adicionar um comentário nesse processo de atendimento.

  Contexto:
    Dado que eu esteja cadastrado como usuario "alicinha@gatinha.com", "123456", "secretario",
    E que esteja na pagina da wiki de atendimento
    E eu seleciono um processo
    E eu clico no botão "Adicionar comentário"

  Cenário: Preenche campo de comentário
    Quando eu preencho o campo "comentário" com "Processo acompanhado também pela professora Maristela Holanda"
    E clico no botão "Confirmar"
    Então sou redirecionado para a página da wiki de atendimento
    E recebo uma mensagem de sucesso 

  Cenário: Deixa o campo de comentário vazio 
    Quando eu não preencho o campo de comentário
    E clico no botão "Confirmar"
    Então recebo uma mensagem de erro