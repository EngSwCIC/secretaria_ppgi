require 'rails_helper'

describe Requirement do
  it "é válido quando o requerimento tem um nome e descrição" do
    requirement = Requirement.new(name: "abcabc", description: "abcdefghijklmnopqrstuvwxyz")
    expect(requirement).to be_valid   
  end

  it "é invalido sem o nome" do
    requirement = Requirement.new(name: nil, description: "abcdefghijklmnopqrstuvwxyz")
    requirement.valid?
    expect(requirement.errors[:name]).to include("não pode ficar em branco")   
  end

  it "é invalido sem a descrição" do
    requirement = Requirement.new(name: "abcabc", description: nil)
    requirement.valid?
    expect(requirement.errors[:description]).to include("não pode ficar em branco")   
  end
end