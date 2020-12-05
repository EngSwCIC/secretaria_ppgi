
#language: pt
#encoding: utf-8

Funcionalidade: Editar processo de atendimento
  Como um secretário cadastrado, 
  para que eu possa manter a Wiki atualizada, 
  eu gostaria de editar um processo de atendimento já cadastrado

  Contexto:
    Dado que eu esteja conectado como usuario "alicinha@gatinha.com", "123456", "secretario"
    E que esteja na página "Wiki de Atendimento"
    E eu clico no botão "Editar"

  Cenário: Preenche campos com informações válidas
    Quando eu preencho o campo "Título" com "Registrar Estágio"
    E preencho o campo "Conteúdo" com "Como registrar o estágio do aluno"
    E clico no botão "Confirmar"
    Então sou redirecionado para a página "Wiki de Atendimento"
    E recebo uma mensagem de sucesso 

  Cenário: Preenche campos com informações inválidas
    Quando eu preencho o campo "Título" com "Registrar Estágio"
    E não preencho o campo "Conteúdo"
    E clico no botão "Confirmar"
    Então recebo uma mensagem de erro