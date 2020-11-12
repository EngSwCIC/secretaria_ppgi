require 'rails_helper'

RSpec.describe WikiEntriesController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  subject(:entry) { WikiEntry.create! valid_attributes }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: entry.id}, session: valid_session
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
      get :edit, params: {id: entry.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Wiki" do
        expect {
          post :create, params: {wiki_entry: valid_attributes}, session: valid_session
        }.to change(WikiEntry, :count).by(1)
      end

      it "redirects to the created wiki" do
        post :create, params: {wiki_entry: valid_attributes}, session: valid_session
        expect(response).to redirect_to(WikiEntry.last)
      end
    end

    context "with invalid params" do
      it "redirects to new wiki entry page" do
        post :create, params: {wiki_entry: invalid_attributes}, session: valid_session
        expect(response).to redirect_to(new_wiki_entry_path(entry.id))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested wiki" do

        put :update, params: {id: entry.id, wiki_entry: new_attributes}, session: valid_session
        entry.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the wiki" do

        put :update, params: {id: entry.id, wiki_entry: valid_attributes}, session: valid_session
        expect(response).to redirect_to(wiki)
      end
    end

    context "with invalid params" do
      it "redirects to edit wiki entry page" do

        put :update, params: {id: entry.id, wiki_entry: invalid_attributes}, session: valid_session
        expect(response).to redirect_to(edit_wiki_entry_path(entry.id))
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested wiki" do
      expect {
        delete :destroy, params: {id: entry.id}, session: valid_session
      }.to change(WikiEntry, :count).by(-1)
    end

    it "redirects to the wikis list" do
      delete :destroy, params: {id: entry.id}, session: valid_session
      expect(response).to redirect_to(wiki_entries_url)
    end
  end

end
