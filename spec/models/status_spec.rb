require 'rails_helper'

RSpec.describe Status, type: :model do
  subject { described_class.new }
  it "is valid with valid name" do
    subject.has_many = 3
    subject.name = "Em espera"
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    expect(subject).to_not be_valid
  end
end