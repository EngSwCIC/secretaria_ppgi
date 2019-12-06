require 'rails_helper'

describe Solicitation do
  it "é válido quando o requerimento tem tipo, data de partida, data de retorno, origem, destino, descrição e status" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "analise", user_id: user.id)
    expect(solicitation).to be_valid   
  end

  it "é invalido sem o tipo" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: nil, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "analise", user_id: user.id)
    solicitation.valid?
    expect(solicitation.errors[:kind]).to include("não pode ficar em branco")   
  end

  it "é invalido sem o data de partida" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: nil, return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "analise", user_id: user.id)
    solicitation.valid?
    expect(solicitation.errors[:departure]).to include("não pode ficar em branco")   
  end

  it "é invalido sem o data de retorno" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: nil, origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "analise", user_id: user.id)
    solicitation.valid?
    expect(solicitation.errors[:return]).to include("não pode ficar em branco")   
  end

  it "é invalido sem o origem" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: nil, destination: "Tokyo", description: "bla_bla_bla_bla", status: "analise", user_id: user.id)
    solicitation.valid?
    expect(solicitation.errors[:origin]).to include("não pode ficar em branco")   
  end

  it "é invalido sem o destino" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: nil, description: "bla_bla_bla_bla", status: "analise", user_id: user.id)
    solicitation.valid?
    expect(solicitation.errors[:destination]).to include("não pode ficar em branco")   
  end

  it "é invalido sem o descrição" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: nil, status: "analise", user_id: user.id)
    solicitation.valid?
    expect(solicitation.errors[:description]).to include("não pode ficar em branco")   
  end

  it "é invalido sem o status" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: nil, user_id: user.id)
    solicitation.valid?
    expect(solicitation.errors[:status]).to include("não pode ficar em branco")   
  end

  it "é invalido sem o user_id" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "analise", user_id: nil)

    expect(solicitation).not_to be_valid   
  end

  it "isAccepted funciona quando o status é \"aprovado\"" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "aprovado", user_id: user.id)
    expect(solicitation.isAccepted).to eq true
  end

  it "isAccepted não funciona quando o status é \"analise\"" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "analise", user_id: user.id)
    expect(solicitation.isAccepted).to eq false
  end

  it "isAccepted não funciona quando o status é \"reprovado\"" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "reprovado", user_id: user.id)
    expect(solicitation.isAccepted).to eq false
  end

  it "isRefused funciona quando o status é \"aprovado\"" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "aprovado", user_id: user.id)
    expect(solicitation.isRefused).to eq false
  end

  it "isRefused não funciona quando o status é \"analise\"" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "analise", user_id: user.id)
    expect(solicitation.isRefused).to eq false
  end

  it "isRefused não funciona quando o status é \"reprovado\"" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "reprovado", user_id: user.id)
    expect(solicitation.isRefused).to eq true
  end

  it "isAnalysing funciona quando o status é \"aprovado\"" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "aprovado", user_id: user.id)
    expect(solicitation.isAnalysing).to eq false
  end

  it "isAnalysing não funciona quando o status é \"analise\"" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "analise", user_id: user.id)
    expect(solicitation.isAnalysing).to eq true
  end

  it "isAnalysing não funciona quando o status é \"reprovado\"" do
    user = User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    solicitation = Solicitation.create(kind: 0, departure: DateTime.new(2020, 10, 16, 22, 35, 0), return: DateTime.new(2020, 10, 25, 22, 35, 0), origin: "Brasília", destination: "Tokyo", description: "bla_bla_bla_bla", status: "reprovado", user_id: user.id)
    expect(solicitation.isAnalysing).to eq false
  end

end
