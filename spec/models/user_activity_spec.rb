require 'rails_helper'

RSpec.describe UserActivity, type: :model do
    fixtures :users, :activities
    before :each do
        @ua_params = {user_id: users(:prof).id, activity_id: activities(:accreditation).id}
    end

    context 'valid instance' do
        after :each do
            expect(@instance).to be_valid
        end
        it 'has an activity associated with a user' do
            @instance = UserActivity.new(@ua_params)
        end
    end

    context 'invalid instance' do
        after :each do
            expect(@instance).to_not be_valid
        end
        it 'has no activity associated with a user' do
            @instance = UserActivity.new(user_id: @ua_params[:user_id])
        end
        it 'has no user associated with an activity' do
            @instance = UserActivity.new(activity_id: @ua_params[:activity_id])
        end
        it 'has neither activity nor a user' do
            @instance = UserActivity.new
        end
        it 'already exists with the same user and activity' do
            first_inst = UserActivity.create!(@ua_params)
            second_inst = UserActivity.new(@ua_params)
            @instance = second_inst
        end
        it 'has a nonexistent user'
        it 'has a nonexistent activity'
    end
end
