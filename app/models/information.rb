class Information < ApplicationRecord
  belongs_to :user
  has_one :source
end
