require 'rails_helper'

RSpec.describe WikiEntriesController, type: :controller do

  let(:valid_attributes) {
    {title: "Processo de trancamento", content: "o processo de trancamento é assim"}
  }

  let(:invalid_attributes) {
    {title: "", content: "o processo de trancamento é assim"}
  }

  after(:each) {
    WikiEntry.delete_all
  }

  let(:entry) { WikiEntry.create! valid_attributes }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: entry.id}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: entry.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Entry" do
        expect {
          post :create, params: {wiki_entry: valid_attributes}
        }.to change(WikiEntry, :count).by(1)
      end

      it "redirects to the created entry" do
        post :create, params: {wiki_entry: valid_attributes}
        expect(response).to redirect_to(WikiEntry.last)
      end
    end

    context "with invalid params" do
      it "redirects to new wiki entry page" do
        post :create, params: {wiki_entry: invalid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: "Processo de mat", content: "Aluno se matr"}
      }

      it "updates the requested entry" do

        put :update, params: {id: entry.id, wiki_entry: new_attributes}
        entry.reload
        expect(entry.title).to eq(new_attributes[:title])
        expect(entry.content).to eq(new_attributes[:content])
        
      end

      it "redirects to the entry" do

        put :update, params: {id: entry.id, wiki_entry: valid_attributes}
        expect(response).to redirect_to(entry)
      end
    end

    context "with invalid params" do
      it "redirects to edit wiki entry page" do

        put :update, params: {id: entry.id, wiki_entry: invalid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested wiki" do
      entry
      expect {
        delete :destroy, params: {id: entry.id}
      }.to change(WikiEntry, :count).by(-1)
    end

    it "redirects to the wikis list" do
      delete :destroy, params: {id: entry.id}
      expect(response).to redirect_to(wiki_entries_url)
    end
  end

end
