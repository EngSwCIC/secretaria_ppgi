#language: pt

Funcionalidade: Usuário pode adicionar uma atividade

    Como um administrador, para que eu tenha controle das atividades,
    eu gostaria de cadastrar uma nova atividade e seu prazo de execução

Cenário: Adicionar atividade de teste com sucesso
    Dado que estou logado com usuário "admin@admin.com" e senha "admin123"
    Dado que estou em "activities"
    Quando clico em "Nova atividade"
    Então devo ser redirecionado para "Cadastrar nova atividade"
    Quando preencho o campo "Título'" com "Teste"
    E preencho o campo "Prazo de execução" com "Apr 30 1999"
    E clico em "Salvar"
    Então devo ser redirecionado para "Atividades"
    E devo ver "Atividade cadastrada com sucesso"

Cenário: Adicionar atividade de teste sem sucesso
    Dado que estou logado com usuário "admin@admin.com" e senha "admin123"
    Dado que estou em "activities"
    Quando clico em "Nova atividade"
    Então devo ser redirecionado para "Cadastrar nova atividade"
    Quando preencho o campo "Título" com "Teste 2"
    E clico em "Salvar"
    Então devo ver "O prazo de execução da atividade deve ser informado"