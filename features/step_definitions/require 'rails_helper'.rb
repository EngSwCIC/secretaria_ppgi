require 'rails_helper'

RSpec.describe Wiki, type: :model do
    describe "#create" do 
        it 'should create a new process when the attributes are valid'
        it 'should not create a new process when the sei_process_code is not a valid code'
        it 'should not create a new process when there is no assigned user'
        it 'should not create a new process when the process_status_id is invalid'
        it 'should not create a new process when trying to attach an invalid file '
    end

    describe "#update" do 
        it 'should update the process when the attributes are valid'
        it 'should not update the process when the sei_process_code is not a valid code'
        it 'should not update the process when there is no assigned user'
        it 'should not update the process when the process_status_id is invalid'
        it 'should not update the process when trying to attach an invalid file'
    end
end



#controller
require 'rails_helper'
require 'capybara/rails'

RSpec.describe WikisController, type: :controller do
  describe "#create" do
    it 'calls the create method from the Wiki model'
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
    it 'calls the update method from an instance of the Wiki model'
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
