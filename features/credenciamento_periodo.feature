#language: pt
#encoding: utf-8

Funcionalidade: Definir o prazo de credenciamento dos professores
  Como um administrador,
  para que eu possa credenciar os professores,
  eu gostaria de definir o prazo de credenciamento dos professores

  Contexto:
    Dado que eu esteja autenticado como usuario "admin"
    E que esteja na página de credenciamento

  Cenário: Definir prazo de credenciamento sem data
    Quando eu aperto o botão "Definir prazo de credenciamento"
    E eu aperto o botão "Salvar período"
    Então eu espero ver a mensagem "Insira uma data de início e uma data de término válidas."

  Cenário: Definir prazo de credenciamento com data
    Quando eu aperto o botão "Definir prazo de credenciamento"
    Quando eu adiciono um valor "Início" para "Data de Início"
    E eu adiciono um valor "Término" para "Data de Término"
    E eu aperto o botão "Salvar período"
    Então eu espero ver a mensagem "Prazo cadastrado com sucesso."