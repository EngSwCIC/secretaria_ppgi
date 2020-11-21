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

  describe 'checks validation' do
    context 'when a valid record' do
      it 'has valid attributes' do
        expect(SeiProcess.create(valid_attributes.merge({documents: document}))).to be_valid
      end
    end

    context 'when a invalid record' do
      it 'comes from user not signed in' do
        sign_out users(:admin)
        Current.user = nil
        expect(SeiProcess.create(valid_attributes.merge({documents: document}))).to_not be_valid
      end

      it 'comes from a non-admin user' do
        sign_out users(:admin)
        Current.user = nil

        sign_in users(:prof)
        Current.user = users(:prof)

        expect(SeiProcess.create(valid_attributes.merge({documents: document}))).to_not be_valid
      end
    end
  end

  # describe 'checks deletion' do
  #   before(:each) do
  #     @some_process = SeiProcess.create(valid_attributes.merge({documents: document}))
  #   end

  #   context 'when a valid deletion' do
  #     it 'comes from an admin user' do
  #       expect(@some_process.destroy).to be_valid
  #     end
  #   end
  # end
end
