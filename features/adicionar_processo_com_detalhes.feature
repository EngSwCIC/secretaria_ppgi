#language: pt

Funcionalidade: Anexar arquivos ao processo
    A fim de manter o processo com o máximo de informações
    Como um secretário 
    Eu quero anexar arquivos a um processo corrente

    Cenário: Secretário anexa arquivo válido
        Dado um processo existente
        Quando adiciono um arquivo 'file.pdf' ao processo
        Então o processo deve constar com o novo arquivo 'file.pdf'
    
    Cenário: Secretário anexa arquivo inválido
        Dado um processo existente
        Quando adiciono um arquivo 'file.exe' ao processo
        Então o processo não deve constar o novo arquivo 'file.exe'