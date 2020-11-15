class Status < ApplicationRecord
    validates :name_status, presence: true
end