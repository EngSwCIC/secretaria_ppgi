

#language: pt

Funcionalidade: Inserir os dados no banco 


Cenario: Inserção de um novo dados no banco com sucesso
Dado que acesso o banco e tem-se  informações a inserir
Quando  insere-se "Funcionario2566" e "Proativoo26!!" 
Entao deve inserir com sucesso os dados no banco
E receber a seguinte mensagem "Attendance was successfully created."



# Sad path
Cenario: Falha ao inserir dados no banco
Dado que acesso a pagina principal 
Quando insere-se um titulo já existente "Funcionario2566"
Entao deve aparecer a mensagem "já está em uso"