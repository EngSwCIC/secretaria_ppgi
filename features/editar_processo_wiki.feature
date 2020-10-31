
#language: pt
#encoding: utf-8

Funcionalidade: Editar processo de atendimento
  Como um secretário cadastrado, 
  para que eu possa manter a Wiki atualizada, 
  eu gostaria de editar um processo de atendimento já cadastrado

  Contexto:
    Dado que eu esteja conectado como usuario "alicinha@gatinha.com", "123456", "secretario"
    E que esteja na página "processos de atendimento"
    E eu seleciono um processo
    E eu clico no botão "Editar processo"

  Cenário: Preenche campos com informações válidas
    Quando eu preencho o campo "número SEI" com "0423-123456/2017"
    E preencho o campo "reponsável" com "Genaína Rodrigues"
    E seleciono o "status" "em andamento"
    E clico no botão "Confirmar"
    Então sou redirecionado para a página "processos de atendimento"
    E recebo uma mensagem de sucesso 

  Cenário: Preenche campos com informações inválidas
    Quando eu preencho o campo "número SEI" com "alilicece"
    E clico no botão "Confirmar"
    Então recebo uma mensagem de erro