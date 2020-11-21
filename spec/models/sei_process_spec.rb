require 'rails_helper'

RSpec.describe SeiProcess, type: :model do
  fixtures :users

  let(:file) {
    fixture_file_upload(Rails.root.join('public', 'TestImage.png'), 'image/png')
  }

  let(:valid_admin_params) {
    {user_id: users(:admin).id, status: 'Espera', code: 0, documents: [file]}
  }

  let(:valid_prof_params) {
    {user_id: users(:prof).id, status: 'Espera', code: 0, documents: [file]}
  }

  let(:invalid_status_params) {
    {user_id: users(:prof).id, status: 'Aprovado', code: 0, documents: [file]}
  }

  let(:invalid_docs_params_by_admin) {
    {user_id: users(:admin).id, status: 'Espera', code: 0}
  }

  let(:invalid_docs_params_by_prof) {
    {user_id: users(:prof).id, status: 'Espera', code: 0}
  }

  describe 'checks an admins creation' do
    before(:each) do
      Current.user = users(:admin)
    end

    context 'when a valid record' do
      it 'has valid attributes' do
        expect(
          SeiProcess.new(valid_admin_params)
        ).to be_valid
      end
    end

    context 'when an invalid record' do
      it 'has no attached documents' do
        expect(
          SeiProcess.new(invalid_docs_params_by_admin)
        ).to_not be_valid
      end
    end
  end

  describe 'checks a non-admins creation' do
    before(:each) do
      Current.user = users(:prof)
    end

    context 'when a valid record' do
      it 'has valid attributes' do
        expect(
          SeiProcess.new(valid_prof_params)
        ).to be_valid
      end
    end

    context 'when an invalid record' do
      it 'has no attached documents' do
        expect(
          SeiProcess.new(invalid_docs_params_by_prof)
        ).to_not be_valid
      end
    end
  end

  describe 'checks a not signed in users creation' do
    before(:each) do
      Current.user = nil
    end

    context 'when an invalid record' do
      it 'comes from not signed in user' do
        expect(
          SeiProcess.new(valid_admin_params)
        ).to_not be_valid
      end
    end
  end
end
