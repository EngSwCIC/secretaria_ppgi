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
user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")

# Requirements
Requirement.destroy_all
Requirement.create(name: "Lorem Ipsum", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam consectetur fringilla dui at pulvinar.")

# Setups
Setup.destroy_all
Setup.create(inicio: DateTime.new(2020, 10, 16, 22, 35, 0), fim:DateTime.new(2020, 10, 25, 22, 35, 0))
Setup.create(inicio: DateTime.new(2020, 11, 16, 22, 35, 0), fim:DateTime.new(2020, 11, 25, 22, 35, 0))

# Solicitation
Solicitation.destroy_all
Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "analise", user_id: user.id)
Solicitation.create(kind: 1, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "analise", user_id: user.id)

# Budgets
Budget.destroy_all
budget = Budget.create(value: +0.0)

# Log
Log.destroy_all
log = Log.create(value: +0.0, description: 'Ola mundo', budget_id: budget.id)

