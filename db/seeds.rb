# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def destroy_records class_name
    class_name.each do |obj|
        obj.allow_deletion!
        obj.destroy
    end
end

# All Stuff
destroy_records(Requirement.all)
destroy_records(Accreditation.all)
destroy_records(SeiProcess.all)

# Users
User.destroy_all
User.create(full_name: "Administrador", email: "admin@admin.com", password: "admin123", role: "administrator", registration: "000000000")
User.create(full_name: "Secretário", email: "secretary@secretary.com", password: "admin123", role: "secretary", registration: "000000000")
User.create(full_name: "Professor", email: "professor@professor.com", password: "admin123", role: "professor", registration: "000000000")
User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
