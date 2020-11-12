#language:pt

Funcionalidade: Anexar arquivo a um processo existente
    Como um secretário, 
    para que eu possa detalhar mais os processos da Wiki, 
    eu gostaria de anexar um ou mais documentos em um processo já existente

    Contexto: 
        Dado que eu esteja conectado como usuario "alicinha@gatinha.com", "123456", "secretario"
        E que esteja na página "processos de atendimentoo"
        E seleciono um processo 
        E clico no botão "Editar processo"

    Cenário: Anexar um arquivo válido
        Quando eu clico no botão "Adicionar documento"  
        E envio o arquivo "documento.pdf"
        E clico no botão "Confirmar"
        Então sou redirecionado para a página "processos de atendimentoo"
        E recebo uma mensagem de sucesso 

    Cenário: Anexar arquivo nválido
        Quando eu clico no botão "Adicionar documento"  
        E envio o arquivo "Pabllo_Vittar_seu_crime.mp4"
        Então recebo uma mensagem de erro