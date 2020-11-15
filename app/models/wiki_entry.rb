class WikiEntry < ApplicationRecord
    has_one_attached :document
    has_many :comments, class_name:"WikiComment"
    validates :title, presence: true
    validates :content, presence: true
end
