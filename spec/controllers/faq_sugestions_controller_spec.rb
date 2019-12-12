require 'rails_helper'

RSpec.describe FaqSugestionsController, type: :controller do
  fixtures :users

  let(:valid_attributes) {
    {topico: 'topico', pergunta: 'pergunta', resposta: 'resposta'}
  }

  let(:valid_attributes_associated) {
    {topico: 'topico', pergunta: 'pergunta', resposta: 'resposta', faq_id: nil}
  }

  let(:invalid_attributes) {
    {topico: nil, pergunta: nil, resposta: nil}
  }

  let(:admin_session) { 
    sign_in users(:admin_user)
  }

  let(:authenticated_user_session) { 
    sign_in users(:regular_user)
  }

  let(:unauthenticated_user_session) { 
    sign_out users(:regular_user)
  }

  describe "GET #index" do
    it "administrator can view all the faq sugestions" do
      FaqSugestion.create! valid_attributes
      get :index, params: {}, session: admin_session
      expect(response).to be_successful
    end
    it "autenticated user cannot view all the faq sugestions" do
      FaqSugestion.create! valid_attributes
      get :index, params: {}, session: authenticated_user_session
      expect(response).to redirect_to faqs_url
    end
    it "others cannot view all the faq sugestions" do
      FaqSugestion.create! valid_attributes
      get :index, params: {}, session: unauthenticated_user_session
      expect(response).not_to be_successful
    end
  end

  describe "GET #show" do
    context "returns a success response" do
      it "show a faq suggestion to admin" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        get :show, params: {id: faq_sugestion.to_param}, session: admin_session
        expect(response).to be_successful
      end
      it "show a faq suggestion to authenticated user" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        get :show, params: {id: faq_sugestion.to_param}, session: authenticated_user_session
        expect(response).to be_successful
      end
      it "show a faq suggestion to UNauthenticated user" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        get :show, params: {id: faq_sugestion.to_param}, session: unauthenticated_user_session
        expect(response).to be_successful
      end
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: unauthenticated_user_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "administrator can NOT edit suggested faq" do
      faq_sugestion = FaqSugestion.create! valid_attributes
      get :edit, params: {id: faq_sugestion.to_param}, session: admin_session
      expect(response).not_to be_successful
    end
    it "authenticated user CAN edit suggested faq" do
      faq_sugestion = FaqSugestion.create! valid_attributes
      get :edit, params: {id: faq_sugestion.to_param}, session: authenticated_user_session
      expect(response).to be_successful
    end
    it "UNauthenticated user can NOT edit suggested faq" do
      faq_sugestion = FaqSugestion.create! valid_attributes
      get :edit, params: {id: faq_sugestion.to_param}, session: unauthenticated_user_session
      expect(response).not_to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params and authenticated user session" do
      it "authenticated user CAN creates a new FaqSugestion" do
        expect {
          post :create, params: {faq_sugestion: valid_attributes}, session: authenticated_user_session
        }.to change(FaqSugestion, :count).by(1)
      end

      it "redirects to the created faq_sugestion" do
        post :create, params: {faq_sugestion: valid_attributes}, session: authenticated_user_session
        expect(response).to redirect_to(FaqSugestion.last)
      end
    end

    context "with invalid sessions (administrator, UNauthenticated)" do
      it "administrator can NOT creat a faq suggestion" do
        expect {
          post :create, params: {faq_sugestion: valid_attributes}, session: admin_session
        }.to change(FaqSugestion, :count).by(0)
      end
      it "UNauthenticated can NOT creat a faq suggestion" do
        expect {
          post :create, params: {faq_sugestion: valid_attributes}, session: unauthenticated_user_session
        }.to change(FaqSugestion, :count).by(0)
      end
    end

    context "with invalid params and authenticated user session (valid session)" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {faq_sugestion: invalid_attributes}, session: authenticated_user_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
  context "Authenticated user CAN update faq suggestions" do
    context "with valid params" do
      let(:new_attributes) {
        {topico: 'new topico', pergunta: 'new pergunta', resposta: 'new resposta', faq_id: nil}
      }

        it "updates the requested faq_sugestion" do
          faq_sugestion = FaqSugestion.create! valid_attributes
          put :update, params: {id: faq_sugestion.to_param, faq_sugestion: new_attributes}, session: authenticated_user_session
          faq_sugestion.reload
          expect(faq_sugestion.topico).to eq(new_attributes[:topico])
          expect(faq_sugestion.pergunta).to eq(new_attributes[:pergunta])
          expect(faq_sugestion.resposta).to eq(new_attributes[:resposta])
        end

        it "updates the requested faq_sugestion with associated faq" do
          faq = Faq.create! valid_attributes
          valid_attributes_associated[:faq_id] = faq.id
          faq_sugestion = FaqSugestion.create! valid_attributes_associated
          put :update, params: {id: faq_sugestion.to_param, faq_sugestion: new_attributes}, session: authenticated_user_session
          faq_sugestion.reload
          expect(faq_sugestion.resposta).to eq(new_attributes[:resposta])
        end

        it "redirects to the faq_sugestion" do
          faq_sugestion = FaqSugestion.create! valid_attributes
          put :update, params: {id: faq_sugestion.to_param, faq_sugestion: valid_attributes}, session: authenticated_user_session
          expect(response).to redirect_to(faq_sugestion)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          faq_sugestion = FaqSugestion.create! valid_attributes
          put :update, params: {id: faq_sugestion.to_param, faq_sugestion: invalid_attributes}, session: authenticated_user_session
          expect(response).to be_successful
        end
      end
    end

    context "invalid session (administrator and unauthenticated user)" do
      let(:new_attributes) {
        {topico: 'new topico', pergunta: 'new pergunta', resposta: 'new resposta'}
      }

      it "Administrator can NOT update faq suggestions" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        put :update, params: {id: faq_sugestion.to_param, faq_sugestion: new_attributes}, session: admin_session
        faq_sugestion.reload
        expect(faq_sugestion.topico).to eq(valid_attributes[:topico])
        expect(faq_sugestion.pergunta).to eq(valid_attributes[:pergunta])
        expect(faq_sugestion.resposta).to eq(valid_attributes[:resposta])
      end
      it "unauthenticated user can NOT update faq suggestions" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        put :update, params: {id: faq_sugestion.to_param, faq_sugestion: new_attributes}, session: unauthenticated_user_session
        faq_sugestion.reload
        expect(faq_sugestion.topico).to eq(valid_attributes[:topico])
        expect(faq_sugestion.pergunta).to eq(valid_attributes[:pergunta])
        expect(faq_sugestion.resposta).to eq(valid_attributes[:resposta])
      end
    end

  end

  describe "DELETE #destroy" do
    context "adiministrator CAN delete suggested faqs" do
      it "destroys the requested faq_sugestion" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        expect {
          delete :destroy, params: {id: faq_sugestion.to_param}, session: admin_session
        }.to change(FaqSugestion, :count).by(-1)
      end

      it "redirects to the faq_sugestions list" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        delete :destroy, params: {id: faq_sugestion.to_param}, session: admin_session
        expect(response).to redirect_to(faq_sugestions_url)
      end
    end

    it "authenticated user can NOT delete suggested faqs" do
      faq_sugestion = FaqSugestion.create! valid_attributes
      expect {
        delete :destroy, params: {id: faq_sugestion.to_param}, session: authenticated_user_session
      }.to change(FaqSugestion, :count).by(0)
    end

    it "unauthenticated user can NOT delete suggested faqs" do
      faq_sugestion = FaqSugestion.create! valid_attributes
      expect {
        delete :destroy, params: {id: faq_sugestion.to_param}, session: unauthenticated_user_session
      }.to change(FaqSugestion, :count).by(0)
    end
  end

  describe "GET #accept" do
    context "CAN accept as Admin" do
      let(:new_attributes) {
        {topico: 'new topico', pergunta: 'new pergunta', resposta: 'new resposta'}
      }
      it "accept the requested faq_sugestion and delete the Faq_suggestion" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        expect {
          get :accept, params: {id: faq_sugestion.to_param}, session: admin_session
        }.to change(FaqSugestion, :count).by(-1)
      end
      it "accept the requested faq_sugestion e new FAQ is created" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        expect {
          get :accept, params: {id: faq_sugestion.to_param}, session: admin_session
        }.to change(Faq, :count).by(1)
      end
      it "accept the requested to associated faq_sugestion and update FAQ" do
        faq = Faq.create! valid_attributes
        new_resposta = {topico: faq.topico, pergunta: faq.pergunta, resposta: 'new resposta', faq_id: faq.id}
        faq_sugestion = FaqSugestion.create! new_resposta
        get :accept, params: {id: faq_sugestion.to_param}, session: admin_session
        faq.reload
        expect(faq.resposta).to eq('new resposta')
      end
      it "redirect to the requested faq_sugestion" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        get :accept, params: {id: faq_sugestion.to_param}, session: admin_session
        expect(response).to redirect_to(faq_sugestions_url)
      end
    end
    context "Can NOT accept as Not Admin" do
      it "authenticated not admin user request faq_sugestion does NOT delete the Faq_suggestion" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        expect {
          get :accept, params: {id: faq_sugestion.to_param}, session: authenticated_user_session
        }.to change(FaqSugestion, :count).by(0)
      end
      it "unauthenticated not admin user request faq_sugestion does NOT delete the Faq_suggestion" do
        faq_sugestion = FaqSugestion.create! valid_attributes
        expect {
          get :accept, params: {id: faq_sugestion.to_param}, session: unauthenticated_user_session
        }.to change(FaqSugestion, :count).by(0)
      end
    end
  end
end

# it "updates the requested faq_sugestion" do
#   faq_sugestion = FaqSugestion.create! valid_attributes
#   put :update, params: {id: faq_sugestion.to_param, faq_sugestion: new_attributes}, session: authenticated_user_session
#   faq_sugestion.reload
#   expect(faq_sugestion.topico).to eq(new_attributes[:topico])
#   expect(faq_sugestion.pergunta).to eq(new_attributes[:pergunta])
#   expect(faq_sugestion.resposta).to eq(new_attributes[:resposta])
# end

# it "redirects to the faq_sugestion" do
#   faq_sugestion = FaqSugestion.create! valid_attributes
#   put :update, params: {id: faq_sugestion.to_param, faq_sugestion: valid_attributes}, session: authenticated_user_session
#   expect(response).to redirect_to(faq_sugestion)
# end