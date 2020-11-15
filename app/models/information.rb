class Information < ApplicationRecord
    validates :content, uniqueness: true
end
