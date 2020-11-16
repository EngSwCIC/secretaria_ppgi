require 'rails_helper'

RSpec.describe WikiCommentsController, type: :controller do

  let!(:entry) {
    WikiEntry.create!({title:"Processo de desligamento", content: "Aluno será desligado"})
  }

  let(:valid_attributes) {
    {content: "Engenharia de Software", entry: entry}
  }
  
  let(:invalid_attributes) {
    {content: "", entry: ""}
  }
  
  after(:each) {
    WikiComment.delete_all
  }
  
  let!(:comment) { WikiComment.create!(valid_attributes) }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params:{wiki_entry_id: entry.id}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: comment.id}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params:{wiki_entry_id: entry.id}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: comment.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {wiki_comment: valid_attributes, wiki_entry_id: entry.id}
        }.to change(WikiComment, :count).by(1)
      end

      it "redirects to the comment's entry" do
        post :create, params: {wiki_comment: valid_attributes, wiki_entry_id: entry.id}
        expect(response).to redirect_to(entry)
      end
    end

    context "with invalid params" do
      it "renders the 'new' page with an error" do
        post :create, params: {wiki_comment: invalid_attributes, wiki_entry_id: entry.id}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {content: "Sprint 2", entry: entry}
      }

      it "updates the requested comment" do

        put :update, params: {id: comment.id, wiki_comment: new_attributes}
        comment.reload
        expect(comment.content).to eq(new_attributes[:content])
        expect(comment.entry).to eq(new_attributes[:entry])
      end

      it "redirects to the comment's entry" do

        put :update, params: {id: comment.id, wiki_comment: new_attributes}
        expect(response).to redirect_to(comment.entry)
      end
    end

    context "with invalid params" do
      it "renders the edit page with an error" do

        put :update, params: {id: comment.id, wiki_comment: invalid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      expect {
        delete :destroy, params: {id: comment.id}
      }.to change(WikiComment, :count).by(-1)
    end

    it "redirects to the entry page" do
      delete :destroy, params: {id: comment.id}
      expect(response).to redirect_to(entry)
    end
  end

end
