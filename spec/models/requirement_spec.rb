require 'rails_helper'

RSpec.describe Requirement, type: :model do
  let(:valid_attributes) {
    file = fixture_file_upload(Rails.root.join('public', 'TestImage.png'), 'image/png')
    {"title" => "test", "content" => "", "documents" => [file]}
  }
  it "is valid with valid attributes" do
    expect(Requirement.new({"title" => "testing"})).to be_valid
  end
  it "is not valid without a title"
  it "is not valid without a description"
  it "is not valid without a start_date"
  it "is not valid without a end_date"
end
