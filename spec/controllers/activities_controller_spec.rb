require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
    describe Activity do
        before(:each) do
            @activity = Activity.new
        end
        it "should be valid" do
            @activity.should be_valid
        end
    end
end
