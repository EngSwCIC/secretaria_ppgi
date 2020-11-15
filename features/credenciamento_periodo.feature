#language: pt
#encoding: utf-8

Funcionalidade: Definir o prazo de credenciamento dos professores
  Como um administrador autenticado no sistema,
  Quero visualizar professores com credenciamento aprovado
  Para definir o prazo de credenciamento dos professores

  Contexto:
    Dado que existam os seguintes credenciamentos sem prazo definido:
    | user_full_name | 
    | Adalberto      |
    | Mariano        |
    | Joel           |
    
    E que eu esteja cadastrado e logado como "Aécio", "aecio@admin.com", "aecio123", "administrator", "200000000"
    E que eu esteja na página de credenciamentos

  Cenário: Definir prazo inserindo uma data válida
    Quando eu escolho definir o prazo de "Mariano"
    E eu seleciono uma data de 'Fim' posterior a data de 'Início'
    E eu aperto 'Salvar'
    Então eu devo receber uma mensagem de sucesso

  Cenário: Definir prazo inserindo data inválida
    Quando eu escolho definir o prazo de "Joel"
    E eu seleciono uma data de 'Fim' anterior a data de 'Início'
    E eu aperto 'Salvar'
    Então eu não devo receber uma mensagem de sucesso