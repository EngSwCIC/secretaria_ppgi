#language: pt
#encoding: utf-8

Funcionalidade: Testar
    Cenário:
        Dado que eu esteja cadastrado e logado como "Gabriel", "gabriel@admin.com", "gabriel123", "administrator", "200000000"
        E que existam os seguintes credenciamentos sem prazo definido:
        | activity_title   | user_full_name |
        | Credenciamento 1 | Adalberto      |
        | Credenciamento 2 | Mariano        |
        | Credenciamento 3 | Joel           |
