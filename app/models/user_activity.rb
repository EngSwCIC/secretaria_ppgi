class UserActivity < ApplicationRecord
    belongs_to :user
    belongs_to :activity

    validates :activity, uniqueness: { scope: :user }
end
