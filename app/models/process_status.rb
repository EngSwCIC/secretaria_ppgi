class ProcessStatus < ApplicationRecord
    validates :name, presence: true, allow_blank: false
    validates :label, presence: true, allow_blank: false
    validates_uniqueness_of :name, message: "You can only have one status with that name"
end