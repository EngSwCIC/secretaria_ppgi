class Information < ApplicationRecord
    validates :content, uniqueness: true
    validates_presence_of :title
    validates_presence_of :content
end
