class Information < ApplicationRecord
    validates :content, uniqueness: true
    validates_presence_of :title, :content, :source_id
end
