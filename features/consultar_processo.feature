#language: pt
Funcionalidade: Consultar processo de atendimento na Wiki
    Como um secretário,
    Quero consultar uma entrada na Wiki sobre um processo de atendimento,
    Para que eu possa me informar sobre como um processo é realizado

    Contexto: 
        Dado que eu esteja conectado como usuario "usuario_secretario@secretario.com", "123456", "secretario"
        E que esteja na página "processos de atendimento"
        E seleciono um processo
        E eu clicar no botão "Ver detalhes"

    Cenário: Consultar um processo de atendimento existente
        Então sou redirecionado para a página "informações do processo"
        E devo poder visualizar o "número SEI" 
        E devo poder visualizar a "responsável"
        E devo poder visualizar o "status"
        E devo poder visualizar os "documentos"
    
    Cenário: Consultar um processo de atendimento inexistente
        Então recebo uma mensagem de erro
