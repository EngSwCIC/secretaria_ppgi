require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'association with attendance' do
    it { should belong_to(:attendance).class_name('Attendance') }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end
