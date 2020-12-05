#language:pt

Funcionalidade: Anexar arquivo a um processo existente
    Como um secretário, 
    para que eu possa detalhar mais os processos da Wiki, 
    eu gostaria de anexar um ou mais documentos em um processo já existente

    Contexto: 
        Dado que eu esteja conectado como usuario "alicinha@gatinha.com", "123456", "secretario"
        E que esteja na página "Wiki de Atendimento"
        E clico no botão "Editar"

    Cenário: Anexar um arquivo válido
        Quando envio o arquivo "document.xml"
        E clico no botão "Confirmar"
        Então sou redirecionado para a página "Processo"
        E recebo uma mensagem de sucesso 

    Cenário: Anexar arquivo inválido
        Quando envio o arquivo "Pabllo_Vittar_seu_crime.mp4"
        E clico no botão "Confirmar"
        Então recebo uma mensagem de erro