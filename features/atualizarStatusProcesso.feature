Funcionalidade: Como um secretário, para que eu possa manter o processo atualizado, eu gostaria de atualizar o status do processo

Cenário: Atualizar o status de um processo autuado (feliz)
    Dado que o processo não está em trânsito em julgado
    E eu sou secretário
    Quando eu clicar para atualizar o status do processo
    Então o novo status do processo será o novo selecionado
    E o processo ainda estará em andamento. 

Cenário: Atualizar o status de um processo terminado (trânsito em julgado) (triste)
    Dado que o processo selecionado esteja julgado
    E eu sou secretário
    Quando eu clicar para atualizar o status do processo 
    Então um erro será mostrado
