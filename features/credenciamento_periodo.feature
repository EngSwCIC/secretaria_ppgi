#language: pt
#encoding: utf-8

Funcionalidade: credenciar de credenciamento dos professores
  Como um administrador autenticado no sistema,
  Quero visualizar professores com credenciamento aprovado
  Para credenciar de credenciamento dos professores

  Contexto:
    Dado que existam os seguintes credenciamentos sem prazo definido:
    | user_full_name | 
    | Alvin          |
    | Simon          |
    | Theodore       |
    
    E que eu esteja cadastrado e logado como "Aécio", "aecio@admin.com", "aecio123", "administrator", "200000000"
    E que eu esteja na página de credenciamentos

  Cenário: Definir prazo inserindo uma data válida
    Quando eu escolho credenciar "Simon"
    E eu seleciono uma data final posterior a data inicial
    E eu aperto 'Salvar'
    Então eu devo receber uma mensagem de sucesso

  Cenário: Definir prazo inserindo data inválida
    Quando eu escolho credenciar "Theodore"
    E eu seleciono uma data final anterior a data inicial
    E eu aperto 'Salvar'
    Então eu devo receber uma mensagem de erro
