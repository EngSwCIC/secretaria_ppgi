#language: pt

Funcionalidade: Usuário pode adicionar uma atividade

    Como um administrador, para que eu tenha controle das atividades,
    eu gostaria de cadastrar uma nova atividade e seu prazo de execução

Cenário: Adicionar atividade de teste
    Dado que eu estou na página "Atividades"
    Quando eu clico em "Nova atividade"
    Então eu devo ser redirecionado para "Cadastrar nova atividade"
    Quando eu preencho o campo "Nome" com "Teste"
    E eu preencho o campo "Prazo de execução" com "Apr 30 1999"
    E eu clico em "Salvar"
    Então eu devo ser redirecionado para "Atividades"
    E eu devo ver "Atividade cadastrada com sucesso"
