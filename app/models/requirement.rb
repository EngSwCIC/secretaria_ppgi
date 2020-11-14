class Requirement < ApplicationRecord
    validates :title, presence: true
    has_many_attached :documents
end
