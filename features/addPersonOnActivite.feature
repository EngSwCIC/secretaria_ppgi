#language: pt

Funcionalidade: Usuário pode adicionar pessoa interessada em uma atividade

	Como um administrador, para que eu possa informar a comunidade, eu gostaria de adicionar pessoas interessadas em cada atividade

	# Cenário Feliz
	Cenário: Adicionar pessoa em atividade
		Dado que estou na página "Atividades" 
		Quando eu clico em "Adicionar pessoa interessada"
		Então eu devo ser redirecionado para "Atividades"
		E eu devo ver "Pessoa adicionada à atividade com sucesso"

	# Cenário Triste
	Cenário: Adicionar pessoa já cadastrada em atividade
		Dado que estou na página "Atividades"
		Quando eu clico em "Adicionar pessoa interessada"
		E essa pessoa já está cadastrada nessa atividade
		Então eu devo ser redirecionado para "Atividades"
		E eu devo ver "Pessoa já está nessa atividade"