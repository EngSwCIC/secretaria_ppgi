class Activity < ApplicationRecord
    #belongs_to: Status

    validates :name, :description, presence: true

end
