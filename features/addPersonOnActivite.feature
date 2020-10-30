#language: pt

Funcionalidade: Usuário pode adicionar pessoa interessada em uma atividade

	Como um administrador, para que eu possa informar a comunidade, eu gostaria de adicionar pessoas interessadas em cada atividade

	# Cenário Feliz
	Cenário: Adicionar pessoa em atividade
		Dado que estou na página "Atividades" 
		Quando eu clico em "Adicionar integrante"
		Então eu devo ser redirecionado para "Cadastrar_novo_integrante"
		Quando preencho o campo "Nome" com "Teste"
		E preencho o campo "Email" com "teste@teste"
		Então eu devo ser redirecionado para "Atividades"
		E eu devo ver "Pessoa adicionada à atividade com sucesso"

	#Cenário Triste
	Cenário: Página não encontrada
		Dado que estou na página "Atividades"
		Quando eu clico em "Adicionar pessoa interessada"
		Então eu devo ser redirecionado para "404"
		E eu devo ver "Página não encontrada"