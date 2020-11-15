class Information < ApplicationRecord
    belongs_to :source
    belongs_to :user, :optional => true

    def self.filter(params)
        where("source_id LIKE = ?", params)
    end
end
