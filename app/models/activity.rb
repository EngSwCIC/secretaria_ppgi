class Activity < ApplicationRecord
    belongs_to :activity_type
    has_many_attached :documents

    enum status: {
        waiting: 0,
        accepted: 1,
        rejected: 2,
        reformation: 3
    }
end
