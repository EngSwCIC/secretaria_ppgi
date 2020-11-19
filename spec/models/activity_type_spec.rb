require 'rails_helper'

RSpec.describe ActivityType, type: :model do
    describe 'validade an activity type' do
        it 'is valid' do
            activity = ActivityType.new(title: 'Credenciamento')
            expect(activity).to be_valid
        end
        it 'is invalid' do
            activity = ActivityType.new
            expect(activity).to_not be_valid
        end
    end
end
