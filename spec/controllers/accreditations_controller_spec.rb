require 'rails_helper'

RSpec.describe AccreditationsController, type: :controller do
  fixtures :users

  let(:file) {
    fixture_file_upload(Rails.root.join('public', 'TestImage.png'), 'image/png')
  }

  let(:valid_prof_params) {
    {user_id: users(:admin).id, status: 'Espera', code: 0, documents: [file]}
  }

  before(:each) do
    sign_in users(:prof)
    Current.user = users(:prof)
    @process = SeiProcess.create!(valid_prof_params)
  
    sign_out users(:prof)
    sign_in users(:admin)
    Current.user = users(:admin)
  end

  let(:valid_attributes) {
    {user_id: users(:prof).id, start_date: '2020-11-15', end_date: '2021-11-15', sei_process_id: @process.id}
  }

  let(:invalid_attributes) {
    {user_id: users(:prof).id, start_date: '2020-11-15', end_date: '2019-11-15', sei_process_id: @process.id}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Accreditation.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      accreditation = Accreditation.create! valid_attributes
      get :show, params: {id: accreditation.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      accreditation = Accreditation.create! valid_attributes
      get :edit, params: {id: accreditation.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {end_date: '2022-11-15'}
      }

      it "updates the requested accreditation" do
        accreditation = Accreditation.create! valid_attributes
        put :update, params: {id: accreditation.to_param, accreditation: new_attributes}, session: valid_session
        accreditation.reload
        expect(accreditation.end_date).to eq(Date.parse(new_attributes[:end_date]))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        accreditation = Accreditation.create! valid_attributes
        put :update, params: {id: accreditation.to_param, accreditation: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested accreditation" do
      accreditation = Accreditation.create! valid_attributes
      expect {
        delete :destroy, params: {id: accreditation.to_param}, session: valid_session
      }.to change(Accreditation, :count).by(-1)
    end
    
    it "redirects to the accreditations list" do
      accreditation = Accreditation.create! valid_attributes
      delete :destroy, params: {id: accreditation.to_param}, session: valid_session
      expect(response).to redirect_to(accreditations_url)
    end

    it "fails to destroy the requested accreditation" do
      accreditation = Accreditation.create! valid_attributes
      sign_out users(:admin)
      
      sign_in users(:prof)
      Current.user = users(:prof)

      expect {
        delete :destroy, params: {id: accreditation.to_param}, session: valid_session
      }.to change(Accreditation, :count).by(0)
    end
  end
end
