require 'rails_helper'

RSpec.describe SeiProcessesController, type: :controller do
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

  let(:some_process) {
    SeiProcess.create!(valid_prof_params)
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    context 'taken by an admin' do
      before(:each) do
        sign_in users(:admin)
        Current.user = users(:admin)
      end

      it "returns a success response" do
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    context 'taken by an non-admin user' do
      before(:each) do
        sign_in users(:prof)
        Current.user = users(:prof)
      end
      
      it "returns a success response" do
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "GET #show" do
    before(:each) do
      sign_in users(:admin)
      Current.user = users(:admin)
    end
    
    it "returns a success response" do
      get :show, params: {id: some_process.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    before(:each) do
      sign_in users(:prof)
      Current.user = users(:prof)
    end

    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    before(:each) do
      sign_in users(:admin)
      Current.user = users(:admin)
    end

    it "returns a success response" do
      get :edit, params: {id: some_process.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    before(:each) do
      sign_in users(:prof)
      Current.user = users(:prof)
    end

    context "with valid params" do
      it "creates a new SeiProcess" do
        expect {
          post :create, params: {sei_process: valid_prof_params}, session: valid_session
        }.to change(SeiProcess, :count).by(1)
      end

      it "redirects to the sei processes list" do
        post :create, params: {sei_process: valid_prof_params}, session: valid_session
        expect(response).to redirect_to(sei_processes_url)
      end

      it "corrects invalid parameters during creation" do
        post :create, params: {sei_process: invalid_status_params}, session: valid_session
        expect(SeiProcess.last.status).to eq(valid_prof_params[:status])
      end
    end

    context "with invalid params" do
      it "do not creates a new SeiProcess due to lack of documents" do
        expect {
          post :create, params: {sei_process: invalid_docs_params_by_prof}, session: valid_session
        }.to change(SeiProcess, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    let(:approval_param) {
      {status: 'Aprovado'}
    }
    
    let(:rejection_param) {
      {status: 'Rejeitado'}
    }
    
    context "when user has permission" do
      before(:each) do
        sign_in users(:admin)
        Current.user = users(:admin)
      end

      it "updates the requested sei_process" do
        put :update, params: {id: some_process.id, sei_process: rejection_param}, session: valid_session
        some_process.reload
        expect(some_process.status).to eq(rejection_param[:status])
      end

      it "redirects to the sei processes list" do
        put :update, params: {id: some_process.id, sei_process: rejection_param}, session: valid_session
        expect(response).to redirect_to(sei_processes_url)
      end

      it "creates an accreditation when a process is approved" do
        expect {
          put :update, params: {id: some_process.id, sei_process: approval_param}, session: valid_session
        }.to change(Accreditation, :count).by(1)
      end
    end

    context "when user does not have permission" do
      before(:each) do
        sign_in users(:prof)
        Current.user = users(:prof)
      end

      it "does not update the requested sei_process" do
        put :update, params: {id: some_process.id, sei_process: approval_param}, session: valid_session
        some_process.reload
        expect(some_process.status).to_not eq(approval_param[:status])
      end
    end
  end

  describe "DELETE #destroy" do
    context "when user has permission" do
      before(:each) do
        sign_in users(:admin)
        Current.user = users(:admin)
      end

      it "destroys the requested sei_process" do
        process = SeiProcess.create!(valid_admin_params)
        process.update_attributes(user_id: users(:prof))
        expect {
          delete :destroy, params: {id: process.to_param}, session: valid_session
        }.to change(SeiProcess, :count).by(-1)
      end

      it "redirects to the sei_processes list" do
        process = SeiProcess.create!(valid_admin_params)
        process.update_attributes(user_id: users(:prof))
        delete :destroy, params: {id: process.to_param}, session: valid_session
        expect(response).to redirect_to(sei_processes_url)
      end
    end

    context "when user does not have permission" do
      before(:each) do
        sign_in users(:prof)
        Current.user = users(:prof)
      end

      it "does not destroys the requested sei_process" do
        process = SeiProcess.create!(valid_prof_params)
        expect {
          delete :destroy, params: {id: process.to_param}, session: valid_session
        }.to change(SeiProcess, :count).by(0)
      end
    end
  end
end
