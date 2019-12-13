class Activity < ApplicationRecord
    has_one :status

    validates :name, presence: true
    validates :description, presence: true
    validates :estado, presence: true
end
