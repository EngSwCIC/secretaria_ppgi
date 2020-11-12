class Activity < ApplicationRecord
    belongs_to :activity_type
    has_many_attached :documents
end
