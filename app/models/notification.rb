class Notification < ApplicationRecord
	validates :title, presence: true
	validates :content, uniqueness: true, presence: true
end
