#language: pt

Funcionalidade: Visualizar os processos de acordo com seus estado

Background: Começar pela página Consulta de Processos

    Dado que eu estou na página 'Consulta de Processos'
    Quando eu selecionar a opção 'Filtrar por estado'
    Então posso selecionar qual estado devo filtrar os processos

Cenário: Visualiza processos 'Transito em Julgado'
    Quando eu selecionar o filtro "Trânsito em Julgado"
    Então aparecerá apenas os processos já terminados

    Cenário: Visualizar um estado em que nenhum processo o possual
    Quando eu selecionar um estado o qual nenhum processo o tenha atribuído
    Então deve aparecer uma mensagem de nenhum resultado encontrado 