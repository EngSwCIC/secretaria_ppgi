class Information < ApplicationRecord
    validates :content, uniqueness: true
    validates_presence_of :title, :content, :source_id
    belongs_to :source

    def self.search(search)
        where("cast (source_id as text) LIKE ?","%#{search}")
    end
end
