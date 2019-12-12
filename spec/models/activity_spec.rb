require 'rails_helper'
# require File.expand_path(File.dirname(__FILE__) + '/helpers/statuses_helper_spec')

RSpec.describe Activity, type: :model do
  subject { described_class.new }
  it "is valid with valid attributes" do
    subject.name = "Joao"
    subject.description = "Quero trancar minha matricula pro proximo semestre"
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.name = "Joao"
    expect(subject).to_not be_valid
  end

  it "is valid without a type of process" do
    subject.name = "Jose"
    subject.description = "Quero trancar minha matricula pro proximo semestre"
    expect(subject).to be_valid
  end
end