#language: pt

Funcionalidade: Buscar um dado no banco


Cenario: Realização de uma busca de dados já existente no Banco de dados
Dado que acesso o banco e tem-se  informações a buscar
Quando  digita-se na barra de Busca o dado "casa"
Entao deve encontrar com sucesso 
E ser capaz de identificar todos os resultados possíveis da busca

# Sad path
Cenario: Busca de Dados não encontrados
Dado que acesse a pagina principal 
Quando busca-se o titulo "titulo inexistente"
Então deve apresentar a mensagem "Nenhuma wiki encontrada"
