require 'rails_helper'

RSpec.describe Log, type: :model do
  it "é válido quando o log tem um valor e descrição" do
    budget = Budget.create(value: 10, id: 35)
    log = Log.create(value: 42, description: "abcdefghijklmnopqrstuvwxyz", budget_id: budget.id)
    expect(log).to be_valid   
  end

  it "é invalido sem o valor" do
    budget = Budget.create(value: 10, id: 35)
    log = Log.new(value: nil, description: "abcdefghijklmnopqrstuvwxyz", budget_id: budget.id)
    log.valid?
    expect(log.errors[:value]).to include("não pode ficar em branco")   
  end

  it "é invalido sem a descrição" do
    budget = Budget.create(value: 10, id: 35)
    log = Log.new(value: 42, description: nil, budget_id: budget.id)
    log.valid?
    expect(log.errors[:description]).to include("não pode ficar em branco")   
  end

end
