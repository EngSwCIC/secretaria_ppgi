class Accreditation < ApplicationRecord
  belongs_to :user
  belongs_to :sei_process
end
