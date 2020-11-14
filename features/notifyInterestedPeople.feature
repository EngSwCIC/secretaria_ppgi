#language: pt

Funcionalidade: Administrador notificar as pessoas interessadas
    
    Como um administrador, 
    Para que eu possa notificar as pessoas interessadas em alguma atividade,
    Eu gostaria de notificar as pessoas interessadas

    #Cenário feliz
    Cenário: Notificar pessoas interessadas
        Dado que estou logado com usuário "admin@admin.com" e senha "admin123"
        Dado que eu me encontro na página "activities"
        Quando pressiono "Notificar integrantes"
        Então eu devo estar em "/notifications/new"
        Quando preencho o campo "Nome da notificação" com "Título notificação"
        E preencho o campo "Conteúdo da notificação" com "Conteúdo notificação"
        Quando no campo "Integrantes interessados" eu seleciono "administrator"
        E pressiono "Enviar notificação"
        Então eu devo conseguir ver "Notificação enviada aos interessados com sucesso." 

    #Cenário triste
    Cenário: Página não encontrada
        Dado que eu me encontro na página "activities"
        Quando pressiono "Notificar integrantes"
        Então devo ser redirecionado para a página "404"
        E eu devo conseguir ver "The page you were looking for doesn't exist."

#estou contando que "Atividades" seja a página home de administração


