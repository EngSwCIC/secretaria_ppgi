#language: pt

Funcionalidade: Usuário pode adicionar uma atividade

    Como um administrador, para que eu tenha controle das atividades,
    eu gostaria de cadastrar uma nova atividade e seu prazo de execução

Cenário: Adicionar atividade de teste com sucesso
    Dado que estou logado com usuário "admin@admin.com" e senha "admin123"
    Dado que estou em "activities"
    Quando clico em "Adicionar atividade"
    Então devo ser redirecionado para "activities/new"
    E devo ver "Cadastrar nova atividade"
    Quando preencho "Nome da atividade" com o valor "Teste"
    E preencho "Prazo de execução" com a data "30/04/1999"
    E clico em "Salvar"
    E devo ver "Atividade cadastrada com sucesso."

Cenário: Adicionar atividade de teste sem sucesso
    Dado que estou logado com usuário "admin@admin.com" e senha "admin123"
    Dado que estou em "activities"
    Quando clico em "Adicionar atividade"
    Então devo ser redirecionado para "activities/new"
    Quando preencho "Nome da atividade" com o valor "Teste 2"
    E clico em "Salvar"
    Então devo ver "O Prazo de execução da atividade deve ser informado."