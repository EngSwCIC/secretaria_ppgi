require 'rails_helper'

RSpec.describe Requirement, type: :model do

  let(:valid_attributes) {
    {"title" => "testing"}
  }

  before(:each) do
    @admin = User.create!(
      full_name: "Sower",
      email: "sower@admin.com",
      password: "admin123",
      role: "administrator",
      registration: "000000000"
    )
    sign_in @admin
    Current.user = @admin
  end

  describe "Title validation" do
    it "is valid with valid attributes" do
      expect(Requirement.new({"title" => "testing"})).to be_valid
    end

    it "is not valid without a title" do
      file = fixture_file_upload(Rails.root.join('public', 'TestImage.png'), 'image/png')
      expect(Requirement.new({"content" => "", "documents" => [file]})).to_not be_valid
    end

    it "is not equal to previous requirement title" do
      requirement = Requirement.create! :valid_attributes
      expect(Requirement.new({"title" => "testing"})).to_not be_valid
    end
  end

end
