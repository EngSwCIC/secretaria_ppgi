require 'rails_helper'

RSpec.describe Budget, type: :model do
  it "é válido se tiver um valor" do
    budget = Budget.new(value: 42)
    expect(budget).to be_valid
  end

  it "é inválido sem um valor" do
    budget = Budget.new(value: nil)
    budget.valid?
    expect(budget.errors[:value]).to include("não pode ficar em branco")
  end


  it "só permite um budget" do
    budget = Budget.create(value: 42)
    expect(Budget.count).to eq 1
    budget2 = Budget.create(value: 56)
    expect(Budget.count).to eq 1
  end

end
