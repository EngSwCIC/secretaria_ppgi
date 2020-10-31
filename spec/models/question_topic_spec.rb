require 'rails_helper'

RSpec.describe Question, type: :model do
    it "valid when exists title" do 
        questionTopic = QuestionTopic.new(title: 'Some topic')
        expect(questionTopic).to be_valid
    end
end