class WikiEntry < ApplicationRecord
    has_one_attached :document
    validates :title, presence: true
    validates :content, presence: true
end
