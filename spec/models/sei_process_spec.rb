require 'rails_helper'

RSpec.describe SeiProcess, type: :model do
  fixtures :users
  before(:each) do
    sign_in users(:admin)
    Current.user = users(:admin)
  end

  let(:valid_attributes) {
    {user_id: users(:admin).id, code: 0}
  }

  let(:document) {
    Rack::Test::UploadedFile.new(Rails.root.join("features/resources/ship.jpg"))
  }

  context 'valid record' do
    it 'has valid attributes' do
      expect(SeiProcess.create(valid_attributes.merge({documents: document}))).to be_valid
    end
  end

  context 'invalid record' do
    it 'comes from user not signed in' do
      sign_out users(:admin)
      Current.user = nil
      expect(SeiProcess.create(valid_attributes.merge({documents: document}))).to_not be_valid
    end
  end
end
