class Requirement < ApplicationRecord
    validates :title, presence: true
end
