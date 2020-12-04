require 'rails_helper'

RSpec.describe RequirementsController, type: :controller do
  fixtures :users

  let(:valid_attributes) {
    file = fixture_file_upload(Rails.root.join('public', 'TestImage.png'), 'image/png')
    {title: "test", content: "", documents: [file]}
  }

  let(:invalid_attributes) {
    {"title" => ""}
  }

  let(:valid_session) { {} }

  context "by an admin" do
    before(:each) do
      sign_in users(:admin)
      Current.user = users(:admin)
    end

    describe "GET #index" do
      it "returns a success response" do
        Requirement.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        requirement = Requirement.create! valid_attributes
        get :show, params: {id: requirement.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        requirement = Requirement.create! valid_attributes
        get :edit, params: {id: requirement.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before(:each) do
        sign_in users(:admin)
        Current.user = users(:admin)
      end

      it "creates a new Requirement" do
        expect {
          post :create, params: {requirement: valid_attributes}, session: valid_session
        }.to change(Requirement, :count).by(1)
      end

      it "redirects to the created requirement" do
        post :create, params: {requirement: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Requirement.last)
      end
    end

    context "with invalid params" do
      before(:each) do
        sign_in users(:admin)
        Current.user = users(:admin)
      end

      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {requirement: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end

    context "by a non-admin user" do
      before(:each) do
        sign_in users(:prof)
        Current.user = users(:prof)
      end
      
      it "does not create a new Requirement" do
        expect {
          post :create, params: {requirement: valid_attributes}, session: valid_session
        }.to change(Requirement, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      file = fixture_file_upload(Rails.root.join('public', 'TestImage.png'), 'image/png')
      {title: "Novo", content: "Conteúdo", documents: [file]}
    }

    context "with valid params" do
      before(:each) do
        sign_in users(:admin)
        Current.user = users(:admin)
      end

      it "updates the requested requirement" do
        requirement = Requirement.create! valid_attributes
        put :update, params: {id: requirement.to_param, requirement: new_attributes}, session: valid_session
        requirement.reload
        expect(requirement.title).to eq(new_attributes[:title])
        expect(requirement.content).to eq(new_attributes[:content])
      end

      it "redirects to the requirement" do
        requirement = Requirement.create! valid_attributes
        put :update, params: {id: requirement.to_param, requirement: valid_attributes}, session: valid_session
        expect(response).to redirect_to(requirement)
      end
    end

    context "with invalid params" do
      before(:each) do
        sign_in users(:admin)
        Current.user = users(:admin)
      end

      it "returns a success response (i.e. to display the 'edit' template)" do
        requirement = Requirement.create! valid_attributes
        put :update, params: {id: requirement.to_param, requirement: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end

    context "by a non-admin user" do
      before(:each) do
        sign_in users(:admin)
        Current.user = users(:admin)
        @requirement = Requirement.create! valid_attributes

        sign_out users(:admin)
        sign_in users(:prof)
        Current.user = users(:prof)
      end

      it "updates the requested requirement" do
        put :update, params: {id: @requirement.to_param, requirement: new_attributes}, session: valid_session
        @requirement.reload
        expect(@requirement.title).to_not eq(new_attributes[:title])
        expect(@requirement.content).to_not eq(new_attributes[:content])
      end
    end
  end

  describe "Documents Management"do
    before(:each) do
      sign_in users(:admin)
      Current.user = users(:admin)
    end

    it 'purges a specific file' do
      requirement = Requirement.create! valid_attributes
      requirement.documents.each do | document |
        expect {
          delete :delete_document_attachment, params: { id: document.id, requirement_id: requirement.id }
        }.to change(ActiveStorage::Attachment, :count).by(-1)
      end
    end
  end

  describe "DELETE #destroy" do
    context "by an admin" do
      before(:each) do
        sign_in users(:admin)
        Current.user = users(:admin)
      end

      it "destroys the requested requirement" do
        requirement = Requirement.create! valid_attributes
        expect {
          delete :destroy, params: {id: requirement.to_param}, session: valid_session
        }.to change(Requirement, :count).by(-1)
      end

      it "redirects to the requirements list" do
        requirement = Requirement.create! valid_attributes
        delete :destroy, params: {id: requirement.to_param}, session: valid_session
        expect(response).to redirect_to(requirements_url)
      end
    end

    context "by a non-admin user" do
      before(:each) do
        sign_in users(:admin)
        Current.user = users(:admin)
        @requirement = Requirement.create! valid_attributes

        sign_out users(:admin)
        sign_in users(:prof)
        Current.user = users(:prof)
      end

      it "does not destroy the requested requirement" do
        expect {
          delete :destroy, params: {id: @requirement.to_param}, session: valid_session
        }.to change(Requirement, :count).by(0)
      end
    end
  end

end
