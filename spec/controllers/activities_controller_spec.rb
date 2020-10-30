require 'rails_helper'
 
describe 'ActivitiesController' do
  describe 'add a new Activity' do
    it 'should call the model method that add a new Activity to the database' do
      post :create, {}
    end
    
    it 'should give a success message after an activity is successfuly added' do
      post :create, {}
      expect(response).to have_http_status(:success)
    end
    
    it 'should give an error message if create is called without params' do
      post :create
      expect(response).to have_http_status(:error)
    end
  end
end