class Status < ApplicationRecord
    has_many: Activities 

    validates :name presence: true

end
