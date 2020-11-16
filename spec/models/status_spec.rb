require 'rails_helper'

describe Status, type: :model do
  it "Valido quando nome esta presente" do
    status = Status.new( name_status: 'Novo')
    expect(status).to be_valid
  end
end

describe Status, type: :model do
  it "Invalido sem o nome" do
    status = Status.new( name_status: nil)
    status.valid?
    expect(status.errors[:name_status]).to include("Nao pode deixar espaço de nome em branco.")
  end
end

describe Status, type: :model do
  it "Invalido caso ja exista um e-mail igual" do
    status = Status.create( name_status: 'Em espera')
    status = Status.new( name_status: 'Em espera')
    status.valid?
    expect(status.errors[:name_status]).to include('Status Repetido')
  end
end