#language: pt
Funcionalidade: Consultar processo de atendimento na Wiki
    Como um secretário,
    Quero consultar uma entrada na Wiki sobre um processo de atendimento,
    Para que eu possa me informar sobre como um processo é realizado

    Contexto: 
        Dado que eu esteja conectado como usuario "usuario_secretario@secretario.com", "123456", "secretario"
        E que esteja na página "Wiki de Atendimento"
        E eu clicar no botão "Exibir"

    Cenário: Consultar um processo de atendimento existente
        Então sou redirecionado para a página "Processo"
        E devo poder visualizar o "Título" 
        E devo poder visualizar o "Conteúdo"
