require 'rails_helper'

describe ProcessStatus, type: :model do
  it "Valido quando nome esta presente" do
    status = ProcessStatus.create( nome: 'Novo')
    expect(processstatus).to be_valid
  end
end

describe ProcessStatus, type: :model do
  it "Invalido sem o nome" do
    status = ProcessStatus.create( nome: nil)
    status.valid?
    expect(status.errors[:nome]).to include("Nao pode deixar espaço de nome em branco.")
  end
end

describe ProcessStatus, type: :model do
  it "Invalido caso ja exista um status com mesmo nome ou label" do
    status = ProcessStatus.create( nome: 'Em espera')
    status = ProcessStatus.create( nome: 'Em espera')
    status.valid?
    expect(status.errors[:nome]).to include('Status Repetido')
  end
end