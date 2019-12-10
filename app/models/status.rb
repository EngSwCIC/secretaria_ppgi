class Status < ApplicationRecord
    belongs_to :activities 

    validates :name, presence: true

end
