require 'rails_helper'

RSpec.describe Requirement, type: :model do
  fixtures :users

  before(:each) do
    sign_in users(:admin)
    Current.user = users(:admin)
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
      Requirement.create! title: "testing"
      expect(Requirement.new({"title" => "testing"})).to_not be_valid
    end
  end

end
