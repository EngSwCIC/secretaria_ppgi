class Activity < ApplicationRecord
    #belongs_to: Status

    validates :name, presence: true
    validates :description, presence: true
    validates :type_activity, presence: false

end
