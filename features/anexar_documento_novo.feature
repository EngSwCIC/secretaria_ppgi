#language:pt

Funcionalidade: Anexar arquivo a um novo processo
    Como um secretário, 
    para que eu possa detalhar mais os processos da Wiki, 
    eu gostaria de anexar um ou mais documentos em um processo já existente

    Contexto: 
        Dado que eu esteja conectado como usuario "usuario_secretario@secretario.com", "123456", "secretario"
        E que esteja na página "Wiki de Atendimento"
        E clico no botão "Adicionar processo"

    Cenário: Anexar um arquivo válido 
        Quando preencho os campos do processo com informações válidas
        E envio o arquivo "document.xml"
        E clico no botão "Confirmar"
        Então sou redirecionado para a página "Processo"
        E recebo uma mensagem de sucesso 

    Cenário: Anexar arquivo inválido 
        Quando envio o arquivo "Pabllo_Vittar_seu_crime.mp4"
        E clico no botão "Confirmar"
        Então recebo uma mensagem de erro