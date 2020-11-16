class Information < ApplicationRecord
    validates :content, uniqueness: true
    validates_presence_of :title
    validates_presence_of :content
    belongs_to :source
    belongs_to :user, :optional => true

    def self.filter(params)
        where("source_id LIKE = ?", params)
    end
end
