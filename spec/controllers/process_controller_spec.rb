require 'rails_helper'

RSpec.describe ProcessController, type: :controller do
  let(:user) {
    test_email = "admin_test@admin.com"
    user = User.find_by(email: test_email)
    if user.nil?
      user = User.create(full_name: "Administrador_teste", email: test_email, password: "admin123", role: "administrator", registration: "000000000")
    end
    return user
  }

  before(:each) do
    sign_in user
  end

  describe "GET #index signed out" do
    it "should redirect to home" do
      sign_out user
      get :index
      expect(response).to redirect_to(root_url)
    end

  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "Process CRUD" do
    before do
      user.processos.destroy_all
    end

    it 'should create a process with no documents' do
      post :create, params: {processo: {process_status_id: 1, sei_process_code: 3, documents: []}}
      expect(assigns(:process)).to be_persisted
    end

    it 'should show a new created process' do
      process = user.processos.create(process_status_id: 1, sei_process_code: 2, documents: [])
      get :show, params: { id: process["id"] }
      processes = assigns(:processes)
      expect(assigns(:process)).to eq(process)
    end
  end

  it 'should delete a created process' do
    process = user.processos.first
    expect{
      delete :destroy, params: {id: process["id"]}
    }.to change(Processo, :count).by(-1)
  end

  it 'should filter all process by status_id' do
    user.processos.create(process_status_id: 2, sei_process_code: 2, documents: [])
    user.processos.create(process_status_id: 1, sei_process_code: 5, documents: [])
    get :search, params: {filter_by: {filter_status: 1}}
    expect(assigns(:processes)).to all(have_member_with_value('process_status_id': 1))
  end

  it 'should attach documents to process' do
    file = fixture_file_upload('files/test_attach.pdf', 'application/pdf')
    process = user.processos.first
    original_documents_length = process.documents.length
    post :attach, :params => {id:process[:id], processo: {id: process[:id], document_files: [file]}}
    expect(Processo.find(process.id).documents.length).to be(original_documents_length+ 1)
  end
end
