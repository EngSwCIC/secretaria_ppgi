class QuestionTopic < ApplicationRecord
  
  validates :title, presence: true
  belongs :question, :class_name=>"Question", :foreign_key => "question_id", optional: true
end