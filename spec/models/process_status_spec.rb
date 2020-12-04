require 'rails_helper'

describe ProcessStatus, type: :model do
  before do
    ProcessStatus.destroy_all
  end

  it "Valido quando nome label esta presente" do
    status = ProcessStatus.create(name: 'new', label: 'Novo')
    expect(status).to be_valid
  end

  it "Invalido sem o nome" do
    status = ProcessStatus.create(name: "")
    expect(status).to be_invalid
  end

  it "Invalido caso ja exista um status com mesmo nome ou label" do
    ProcessStatus.create( name: 'waiting', label: 'Em espera')
    status = ProcessStatus.create( name: 'waiting', label: 'Em espera')
    puts(status.valid?)
    expect(status.errors["name"]).to include('You can only have one status with that name')
  end
end