# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.destroy_all
User.create(full_name: "administrador", email: "in@in.com", password: "in123", role: "administrator", registration: "000000000")
User.create(full_name: "Secretário", email: "secretary@secretary.com", password: "in123", role: "secretary", registration: "000000000")
User.create(full_name: "Professor", email: "professor@professor.com", password: "in123", role: "professor", registration: "000000000")
User.create(full_name: "Aluno", email: "student@student.com", password: "in123", role: "student", registration: "000000000")

Faq.destroy_all
Faq.create(topico: "Matérias de verão", pergunta: "Quando começam as matriculas?", resposta: "Dia 04/01/20")
Faq.create(topico: "Matérias de verão", pergunta: "Quando terminam as matriculas?", resposta: "Dia 14/01/20")
Faq.create(topico: "Matérias de verão", pergunta: "Quais matérias serão ofertadas pelo CIC nesse verão?", resposta: "OAC,ISC,ED")
Faq.create(topico: "Matérias de verão", pergunta: "Quando começam as aulas de verão?", resposta: "Dia 26/01/20")
Faq.create(topico: "Matérias de verão", pergunta: "Quando terminam as aulas de verão?", resposta: "Dia 31/02/20")

Faq.create(topico: "Atendimento cordenação", pergunta: "Quando começa o período de atendimento aos alunos de graduação?", resposta: "Dia 04/01/20")
Faq.create(topico: "Atendimento cordenação", pergunta: "Quando termina o período de atendimento aos alunos de graduação?", resposta: "Dia 14/01/20")
Faq.create(topico: "Atendimento cordenação", pergunta: "Quem será o cordenador responsável nesse semestre", resposta: "Bacharel - Prof. JOÃO , LIC - Prof. Maria")
Faq.create(topico: "Atendimento cordenação", pergunta: "Qual o o horário de atendimento para alunos PNEs", resposta: "SEG-TER , 14:16")


Faq.create(topico: "Reintegração de alunos", pergunta: "Quando começa o período para realizar o pedido de reintegração?", resposta: "Dia 04/01/20")
Faq.create(topico: "Reintegração de alunos", pergunta: "Onde enviar a solicitação?", resposta: "O pedido deve ser realizado em documento específico disponível no site do CIC na aba reintegração")
Faq.create(topico: "Reintegração de alunos", pergunta: "Qual o prazo de resposta?", resposta: "Após protocolado o pedido, a universidade responderá em até 20 dias")
Faq.create(topico: "Reintegração de alunos", pergunta: "Caso o pedido seja deferido,posso voltar no mesmo semestre?", resposta: "No caso de deferimento,o aluno poderá retornar apenas no semestre seguinte")

