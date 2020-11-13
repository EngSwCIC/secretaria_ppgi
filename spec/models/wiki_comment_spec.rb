require 'rails_helper'

RSpec.describe WikiComment, type: :model do
  let(:valid_attributes) {
    {id: 1, content:'content'}
  }

  subject(:entry) {
    WikiComment.create(valid_attributes)
  }

  describe "Validations" do 
      
      it "is valid with the valid attributes" do
        expect(WikiComment.new(valid_attributes)).to be_valid
      end

      it "is not valid without a content" do
        expect(WikiComment.new({id: 1, content: ''})).to_not be_valid
      end
      
  end

end
