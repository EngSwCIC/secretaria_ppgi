# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.destroy_all
User.create(full_name: "Administrador", email: "admin@admin.com", password: "admin123", role: "administrator", registration: "000000000")
User.create(full_name: "Secretário", email: "secretary@secretary.com", password: "admin123", role: "secretary", registration: "000000000")
User.create(full_name: "Professor", email: "professor@professor.com", password: "admin123", role: "professor", registration: "000000000")
User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")

RequestType.create(name: "general", label: "Solicitação geral")
RequestType.create(name: "enroll_payment", label: "Pagamento de inscrição")
RequestType.create(name: "financial_assistance", label: "Auxílio financeiro")
RequestType.create(name: "proficiency", label: "Proficiência")
RequestType.create(name: "deadline_extension", label: "Prorrogação de prazo")
RequestType.create(name: "qualification", label: "Qualificação")
RequestType.create(name: "credits_transfer", label: "Aproveitamento de estudos")
RequestType.create(name: "graduation_enrollment", label: "Matrícula de aluno de graduação")
RequestType.create(name: "general_enrollment", label: "Matrículas gerais de alunos")

ProcessStatus.create(name: "under_examination", label:"Em análise")
ProcessStatus.create(name: "waiting_response", label:"Aguardando parecer")
ProcessStatus.create(name: "sent_to_another_section", label:"Enviado para outro setor")
ProcessStatus.create(name: "suspended", label:"Processo sobrestado")
ProcessStatus.create(name: "done", label:"Concluído")

