

#language: pt

Funcionalidade: Edição dos dados  

Cenario: Realização de edição com sucesso 
Dado que acesso o banco e tem-se  informações disponíveis
Quando  deseja-se alterar qualquer titulo de um dado para "Agente 007" 
Entao deve Editar com sucesso e apresentar "Attendance was successfully updated."


# Sad path
Cenario: Falha na edição do dados
Dado que conecta-se ao banco 
Quando  alterar qualquer titulo já existente, como titulo "Agente 007" 
Entao deve falhar e mostrar "já está em uso"

