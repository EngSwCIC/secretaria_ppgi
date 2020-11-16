require 'rails_helper'

describe ProcessStatus, type: :model do
  it "Valido quando nome esta presente" do
    status = Status.new( title: 'Novo')
    expect(status).to be_valid
  end
end

describe ProcessStatus, type: :model do
  it "Invalido sem o nome" do
    status = Status.new( title: nil)
    status.valid?
    expect(status.errors[:title]).to include("Nao pode deixar espaço de nome em branco.")
  end
end

describe ProcessStatus, type: :model do
  it "Invalido caso ja exista um e-mail igual" do
    status = Status.create( title: 'Em espera')
    status = Status.new( title: 'Em espera')
    status.valid?
    expect(status.errors[:title]).to include('Status Repetido')
  end
end