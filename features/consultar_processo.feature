Funcionalidade: Consultar processo de atendimento na Wiki
    Como um secretário,
    Quero consultar uma entrada na Wiki sobre um processo de atendimento,
    Para que eu possa me informar sobre como um processo é realizado

    Contexto: 
        Dado que eu esteja cadastrado como secretario "secretary@secretary.com", "admin123", "secretary",
        E que esteja logado,
        E que esteja na página de atendimento da Wiki
        E eu clicar no link "Ver detalhes"

    Cenário: Consultar um processo de atendimento
        Quando eu clicar no botão "Ver detalhes"
        Então eu devo estar em uma página com as informações do processo
