require 'rails_helper'

RSpec.describe UserActivity, type: :model do
    context "a user's activity is valid" do
        it 'is valid has an activity associated with a user'
    end

    context "a user's activity is invalid" do
        it 'has no activity associated with a user'
        it 'has no user associated with an activity'
        it 'has neither activity nor a user'
    end
end
