#language: pt

Funcionalidade: Administrador notificar as pessoas interessadas
    
    Como um administrador, 
    Para que eu possa notificar as pessoas interessadas em alguma atividade,
    Eu gostaria de notificar as pessoas interessadas

	Background: Administrador está logado
		Dado que estou na página "users/sign_in"
		E preencho o campo "Email" com "admin@admin.com"
		E preencho o campo "Password" com "admin123"
		Quando pressiono "Log in"
		Então eu devo ser redirecionado para "root_path"
    
    Cenário: Notificar pessoas interessadas
        Dado que estou na página "Atividades"
        Quando pressiono "Notificar integrantes"
        Então eu devo ser redirecionado para "Notificar_integrantes_selecionados"
        Quando preencho o campo "Integrantes interessados" com os "Estudantes"
        E pressiono "Enviar notificação"
        Então eu devo ver "Notificação enviada aos interessados com sucesso" 

#estou contando que "Atividades" seja a página home de administração


