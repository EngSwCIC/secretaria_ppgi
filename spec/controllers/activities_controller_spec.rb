require 'rails_helper'
 
describe ActivitiesController, type: :controller do
  describe 'create a new Activity' do
    it 'should call the model method that creates a new Activity' do
      activity_attrs = attributes_for(:activity)
      expect {post :create, params: {activity: activity_attrs}}.to change(Activity, :count).by(1)
    end
    
    it 'should go back to the activities page after a successfully addition' do
      activity_attrs = attributes_for(:activity)
      post :create, params: {activity: activity_attrs}
      expect(response).to redirect_to(activities_path)
    end
    
    it 'should redirect to the same page when there was an error after adding an activity ' do
      activity_attrs = attributes_for(:activity, title: "Testing the wrong way", due_date: nil)
      post :create, params: {activity: activity_attrs}
      expect(response).to redirect_to(new_activity_path)
    end
  end
end