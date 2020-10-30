#language: pt

Funcionalidade: Cadastrar um novo processo
Como um secretário, para que eu possa disponibilizar
informações sobre os processos, eu gostaria de cadastrar
um novo processo

Cenário: Secretário cadastra um processo (caminho feliz)
Dado que o secretário preencheu todos os campos obrigatórios
Quando der um submit no formulário, um novo processo será criado
Então um o processo será gravado no banco e a ferramenta retonará "Sucesso"

Cenário: Secretário cadastra um processo (caminho triste)
Dado que o secretário esqueceu um ou mais campos obrigatórios
Quando der um submit no formulário, um novo processo será criado
Então o formulário recusará o submit e a ferramenta retonará "Campos inválidos"
