class Requirement < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    has_many_attached :documents
end
