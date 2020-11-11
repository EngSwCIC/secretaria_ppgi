class Activity < ApplicationRecord
    validates :activity_type_id, presence: true
end
