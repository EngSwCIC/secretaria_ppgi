require 'rails_helper'
require 'capybara/rails'

RSpec.describe ProcessosController, type: :controller do
  describe "#create" do
    it 'calls the create method from the Processos model'
    describe "valid params" do 
      it 'saves the process in DB'
      it "responds with an success HTTP status"
      it 'redirects to process index page'  
    end
    describe "invalid params" do 
      it "doesn't save the process in DB"
      it "responds with an error HTTP status"
    end 
  end

  describe "#update" do 
    it 'calls the update method from an instance of the Processos model'
    describe "valid params" do 
      it 'updates the process data in the DB'
      it "responds with an success HTTP status"
      it 'redirects to process index page'  
    end
    describe "invalid params" do 
      it "doesn't update the process data in the DB"
      it "responds with an error HTTP status"
    end 
  end

  describe "#show" do 
    describe "valid process" do 
      it "responds with an success HTTP status"
      it 'redirects to process show page' 
    end
    describe "invalid process" do 
      it "responds with an error HTTP status"
    end
  end

  describe "add comment" do 
    it "calls the create method from the Comentarios model"
    describe "valid params" do 
      it 'saves the comment in DB'
      it "responds with an success HTTP status"
      it 'redirects to comment index page'  
    end
    describe "invalid params" do 
      it "doesn't save the comment in DB"
      it "responds with an error HTTP status"
    end 
  end
end
