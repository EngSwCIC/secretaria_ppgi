require 'rails_helper'

RSpec.describe FaqSugestionsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      FaqSugestion.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      faq_sugestion = FaqSugestion.create! valid_attributes
      get :show, params: {id: faq_sugestion.to_param}, session: valid_session
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
      faq_sugestion = FaqSugestion.create! valid_attributes
      get :edit, params: {id: faq_sugestion.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new FaqSugestion" do
        expect {
          post :create, params: {faq_sugestion: valid_attributes}, session: valid_session
        }.to change(FaqSugestion, :count).by(1)
      end

      it "redirects to the created faq_sugestion" do
        post :create, params: {faq_sugestion: valid_attributes}, session: valid_session
        expect(response).to redirect_to(FaqSugestion.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {faq_sugestion: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested faq_sugestion" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        put :update, params: {id: faq_sugestion.to_param, faq_sugestion: new_attributes}, session: valid_session
        faq_sugestion.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the faq_sugestion" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        put :update, params: {id: faq_sugestion.to_param, faq_sugestion: valid_attributes}, session: valid_session
        expect(response).to redirect_to(faq_sugestion)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        put :update, params: {id: faq_sugestion.to_param, faq_sugestion: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested faq_sugestion" do
      faq_sugestion = FaqSugestion.create! valid_attributes
      expect {
        delete :destroy, params: {id: faq_sugestion.to_param}, session: valid_session
      }.to change(FaqSugestion, :count).by(-1)
    end

    it "redirects to the faq_sugestions list" do
      faq_sugestion = FaqSugestion.create! valid_attributes
      delete :destroy, params: {id: faq_sugestion.to_param}, session: valid_session
      expect(response).to redirect_to(faq_sugestions_url)
    end
  end

end
