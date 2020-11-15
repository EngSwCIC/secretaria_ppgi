Funcionalidade: Como um secretário, eu gostaria de anexar arquivos ao cadastro de um novo processo para que eu possa disponibilizar informações sobre os processos.

Cenário: Anexar arquivos válidos 
     Dado que todos os arquivos anexados são de formatos válidos
     E eu sou secretário
     Quando eu clicar para anexar arquivos
     Então os arquivos serão anexados
     E mostra uma mensagem de operação concluída 

Cenário: Anexar arquivos inválidos
     Dado que pelo menos um arquivo anexado foi de formato não válido
     E eu sou secretário
     Quando eu clicar para anexar arquivos 
     Então mostra uma mensagem de erro