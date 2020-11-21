require 'rails_helper'

RSpec.describe AccreditationsController, type: :controller do

   before(:each) do
    @admin = User.find_by(email: "sower@admin.com")
    @admin = User.create!(
      full_name: "Sower",
      email: "sower@admin.com",
      password: "admin123",
      role: "administrator",
      registration: "000000000"
    ) if @admin == nil
    sign_in @admin
    Current.user = @admin

    @prof = User.find_by(email: "sower@prof.com")
    @prof = User.create!(
      full_name: "Sower",
      email: "sower@prof.com",
      password: "admin123",
      role: "professor",
      registration: "000000000"
    ) if @prof == nil

    @sei_process = SeiProcess.create!(
      user_id: @admin.id, 
      code: 0,
      documents: Rack::Test::UploadedFile.new(Rails.root.join("features/resources/ship.jpg"))
    )
  end


  let(:valid_attributes) {
    {user_id: @admin.id, start_date: '2020-11-15', end_date: '2021-11-15', sei_process_id: @sei_process.id}
  }

  let(:invalid_attributes) {
    {user_id: @admin.id, start_date: nil, end_date: '2021-11-15', sei_process_id: @sei_process.id}
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
        expect(accreditation.end_date).to eq(Date.parse('2022-11-15'))
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

    it "fails to destroy the requested accreditation" do
      accreditation = Accreditation.create! valid_attributes
      sign_out @admin
      Current.user = nil

      sign_in @prof
      Current.user = @prof
      expect {
        delete :destroy, params: {id: accreditation.to_param}, session: valid_session
      }.to change(Accreditation, :count).by(0)
    end

    it "redirects to the accreditations list" do
      accreditation = Accreditation.create! valid_attributes
      delete :destroy, params: {id: accreditation.to_param}, session: valid_session
      expect(response).to redirect_to(accreditations_url)
    end
  end

end

