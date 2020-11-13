#language: pt
#encoding: utf-8

Funcionalidade: Definir o prazo de credenciamento dos professores
  Como um administrador autenticado no sistema,
  Quero visualizar professores com credenciamento aprovado
  Para definir o prazo de credenciamento dos professores

  Contexto:
    Dado que existam os seguintes credenciamentos sem prazo definido:
    | accreditation_title | user_full_name |
    | Credenciamento 1    | Adalberto      |
    | Credenciamento 2    | Mariano        |
    | Credenciamento 3    | Joel           |
    
    E que eu esteja cadastrado e logado como "Aécio", "aecio@admin.com", "aecio123", "administrator", "200000000"
    E que esteja na página de credenciamentos

  Cenário: Definir prazo inserindo uma data válida
    Quando eu clico em "Credenciamento 2"
    Então eu devo estar na página de "Credenciamento 2"
    Quando eu seleciono uma data posterior a atual em 'Prazo'
    E eu aperto 'Salvar'
    Então eu devo ver "Prazo cadastrado com sucesso"

  Cenário: Definir prazo inserindo data inválida
    Quando eu clico em "Credenciamento 3"
    Então eu devo estar na página de "Credenciamento 3"
    Quando eu seleciono uma data anterior a atual em 'Prazo'
    E eu aperto 'Salvar'
    Então eu devo ver "Prazo não cadastrado - data inválida"