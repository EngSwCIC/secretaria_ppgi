class Attendance < ApplicationRecord
  validates :title, :content, presence: true
  has_many_attached :files
  has_many :comments, dependent: :destroy
end
