

#language: pt

Funcionalidade: Inserir os dados no banco 


Cenario: Inserção de um novo dados no banco com sucesso
Dado que acesso o banco e tem-se  informações a inserir
Quando  insere-se "Funcionario" e "Proativoo!!" 
Entao deve inserir com sucesso os dados no banco
E receber a seguinte mensagem "Attendance was successfully created."



# Sad path
Cenario: Falha ao inserir dados no banco
Dado que acesso a pagina principal 
Quando insere-se um titulo já existente "Funcionario"
Entao deve aparecer a mensagem "já está em uso"


# teste para anexo de arquivo

Cenario: Anexo de arquivos em um registro com sucessso
Dado que cria um novo registro com os campos "Pessoa" e "Dedicada"
Quando anexa um arquivo com o nome "cal3na_30.pdf"
Entao deve criar com sucesso o registro e visualizar o arquivo anexado