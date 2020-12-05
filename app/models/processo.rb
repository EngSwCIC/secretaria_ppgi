class Processo < ApplicationRecord
  belongs_to :user
  has_many :documents

  validates :sei_process_code, presence: true, allow_blank: false
  validates_uniqueness_of :sei_process_code, message: "You can only have one process with that status"
end