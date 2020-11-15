require 'rails_helper'

RSpec.describe WikiCommentsController, type: :controller do

  
  let(:valid_attributes) {
    {content: "Engenharia de Software"}
  }
  
  let(:invalid_attributes) {
    {content: ""}
  }
  
  let(:valid_session) { {} }
  
  subject(:comment) { WikiComment.create! valid_attributes }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: comment.id}, session: valid_session
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
      get :edit, params: {id: comment.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comentario" do
        expect {
          post :create, params: {wiki_comment: valid_attributes}, session: valid_session
        }.to change(WikiComment, :count).by(1)
      end

      it "redirects to the created comentario" do
        post :create, params: {wiki_comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(WikiComment.last)
      end
    end

    context "with invalid params" do
      it "redirects to new page" do
        post :create, params: {wiki_comment: invalid_attributes}, session: valid_session
        expect(response).to redirect_to(new_wiki_comment_path(comment.id))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {content: "Sprint 2"}
      }

      it "updates the requested comentario" do

        put :update, params: {id: comment.id, wiki_comment: new_attributes}, session: valid_session
        comment.reload
        expect(comment).to eq(new_attributes)
      end

      it "redirects to the comentario" do

        put :update, params: {id: comment.id, wiki_comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(comment)
      end
    end

    context "with invalid params" do
      it "redirects to the edit page" do

        put :update, params: {id: comment.id, wiki_comment: invalid_attributes}, session: valid_session
        expect(response).to redirect_to(edit_wiki_comment_path(comment.id))
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comentario" do
      expect {
        delete :destroy, params: {id: comment.id}, session: valid_session
      }.to change(WikiComment, :count).by(-1)
    end

    it "redirects to the comentarios list" do
      delete :destroy, params: {id: comment.id}, session: valid_session
      expect(response).to redirect_to(wiki_comments_url)
    end
  end

end
