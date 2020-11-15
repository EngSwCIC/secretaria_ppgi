class Source < ApplicationRecord
    has_many :information, dependent: :destroy
end
