class Attendance < ApplicationRecord
  validates :title, :content, presence: true
end
