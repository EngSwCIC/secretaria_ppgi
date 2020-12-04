#language: pt
Funcionalidade: Como um secretário, eu gostaria de anexar arquivos ao cadastro de um novo processo para que eu possa disponibilizar informações sobre os processos.


  Cenario: Anexar arquivos validos sendo um usuario registrado
Dado que sou usuario
E estou registrado
Quando eu clicar para anexar arquivos a um novo processo
Entao devo receber como retorno mensagem de sucesso

Cenario: Anexar arquivos invalidos sendo um usuario registrado
Dado que sou usuario
E estou registrado
Quando eu clicar para anexar arquivos a um novo processo
Entao devo receber como retorno mensagem de falha

Cenario: Anexar arquivos validos ou invalidos sendo um usuario nao registrado
Dado que sou usuario
E nao estou registrado
Quando eu clicar para anexar arquivos a um novo processo
Entao devo ser encaminhado para a pagina inicial