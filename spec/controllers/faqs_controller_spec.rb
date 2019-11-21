require 'rails_helper'

RSpec.describe FaqsController, type: :controller do

  let(:valid_attributes) {
    {topico: 'topico', pergunta: 'pergunta', resposta: 'resposta'}
  }

  let(:invalid_attributes) {
    {topico: nil, pergunta: nil, resposta: nil}
  }

  let(:valid_session) { 
    { email: "admin@admin.com", password: "admin123" }
   }

  describe "GET #index" do
    it "returns a success response" do
      Faq.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      faq = Faq.create! valid_attributes
      get :show, params: {id: faq.to_param}, session: valid_session
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
      faq = Faq.create! valid_attributes
      get :edit, params: {id: faq.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Faq" do
        expect {
          post :create, params: {faq: valid_attributes}, session: valid_session
        }.to change(Faq, :count).by(1)
      end

      it "redirects to the created faq" do
        post :create, params: {faq: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Faq.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {faq: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested faq" do
        faq = Faq.create! valid_attributes
        put :update, params: {id: faq.to_param, faq: new_attributes}, session: valid_session
        faq.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the faq" do
        faq = Faq.create! valid_attributes
        put :update, params: {id: faq.to_param, faq: valid_attributes}, session: valid_session
        expect(response).to redirect_to(faq)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        faq = Faq.create! valid_attributes
        put :update, params: {id: faq.to_param, faq: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested faq" do
      faq = Faq.create! valid_attributes
      expect {
        delete :destroy, params: {id: faq.to_param}, session: valid_session
      }.to change(Faq, :count).by(-1)
    end

    it "redirects to the faqs list" do
      faq = Faq.create! valid_attributes
      delete :destroy, params: {id: faq.to_param}, session: valid_session
      expect(response).to redirect_to(faqs_url)
    end
  end

end
