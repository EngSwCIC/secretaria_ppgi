require 'rails_helper'

describe Setup do
  it "é válido quando o requerimento tem o início e o fim" do
    setup = Setup.new(inicio: DateTime.new(2020, 10, 16, 22, 35, 0), fim: DateTime.new(2020, 10, 25, 22, 35, 0))
    expect(setup).to be_valid   
  end

  it "é invalido sem o inicio" do
    setup = Setup.new(inicio: nil, fim: DateTime.new(2020, 10, 25, 22, 35, 0))
    setup.valid?
    expect(setup.errors[:inicio]).to include("não pode ficar em branco")   
  end

  it "é invalido sem o fim" do
    setup = Setup.new(inicio: DateTime.new(2020, 10, 16, 22, 35, 0), fim: nil)
    setup.valid?
    expect(setup.errors[:fim]).to include("não pode ficar em branco")
  end
end