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

  def sucresponde(metodo, parametros)
    get metodo, params:parametros
    
  end

  def delete_comment_on_id(comment_id)
    delete :destroy, params: {id: comment_id}
  end

  def update_with_attributes(attributes)
    put :update, params: {id: comment.id, wiki_comment: attributes}
  end

  shared_examples "receive_response" do |metodo, parametro|
    it "returns a success response" do

      if(parametro== "wiki") then 
        get metodo, params: {wiki_entry_id: entry.id}
       
      else
        get metodo, params:{id: comment.id}
      end
      # get :index, params:{wiki_entry_id: entry.id}
      expect(response).to be_successful
    end

  end

  describe "GET #index" do
    it_behaves_like 'receive_response', :index, "wiki"
  end

  describe "GET #show" do
    it_behaves_like 'receive_response', :show, "comment"

  end

  describe "GET #new" do
    it_behaves_like 'receive_response', :new, "wiki"
  end

  describe "GET #edit" do
    it_behaves_like 'receive_response', :edit, "comment"
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
        update_with_attributes(new_attributes)
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
        update_with_attributes(invalid_attributes)

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      expect {
        idCom= comment.id
        delete_comment_on_id(idCom)
      }.to change(WikiComment, :count).by(-1)
    end

    it "redirects to the entry page" do
      idCom= comment.id
      delete_comment_on_id(idCom)
      expect(response).to redirect_to(entry)
    end
  end

end
