require 'rails_helper'
RSpec.describe WikiEntry, type: :model do

  let(:valid_attributes) {
    {id: 1, title: 'title', content:'content'}
  }


  let(:document) {
    Rack::Test::UploadedFile.new(Rails.root.join("spec/support/assets/document.xml"))
  }

  subject(:entry) {
    WikiEntry.create(valid_attributes)
  }

  describe "Validations" do 
      
      it "is valid with the valid attributes" do
        expect(WikiEntry.new(valid_attributes)).to be_valid
      end
      
      it "is valid with a valid document" do 
        expect(WikiEntry.new(valid_attributes.merge({document: document}))).to be_valid
      end

      it "is not valid without a title" do
        expect(WikiEntry.new({id: 1, title: '', content: 'content'})).to_not be_valid
      end

      it "is not valid without a content" do
        expect(WikiEntry.new({id: 1, title: 'title', content: ''})).to_not be_valid
      end

  end

end