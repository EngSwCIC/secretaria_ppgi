
#language: pt
#encoding: utf-8

Funcionalidade: Adicionar comentário a um processo de atendimento
  Como um secretário, 
  para que eu possa adicionar informações a um processo de atendimento, 
  sem alterar o conteúdo original, 
  eu gostaria de adicionar um comentário nesse processo de atendimento.

  Contexto:
    Dado que eu esteja conectado como usuario "alicinha@gatinha.com", "123456", "secretario"
    E que esteja na página "Processo"
    E eu clico no botão "Adicionar comentário"

  Cenário: Preenche campo de comentário
    Quando eu preencho o campo "Conteúdo" com "Processo acompanhado também pela professora Maristela Holanda"
    E clico no botão "Confirmar"
    Então sou redirecionado para a página "Wiki de Atendimento"
    E recebo uma mensagem de sucesso 

  Cenário: Deixa o campo de comentário vazio 
    Quando eu não preencho o campo "Conteúdo"
    E clico no botão "Confirmar"
    Então recebo uma mensagem de erro