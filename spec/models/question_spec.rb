require 'rails_helper'

RSpec.describe Question, type: :model do
    it "valid when exists topic, title and answer" do 
        question = Question.new(question_topic_id: 1, 
        title: 'Some question',
        answer: 'Some answer')
        expect(question).to be_valid
    end
end