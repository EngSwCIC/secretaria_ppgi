class UserActivity < ApplicationRecord
    belongs_to :user
    belongs_to :activity

    # validates :user, presence: true
    # validates :activity, presence: true
    validates :activity, uniqueness: { scope: :user }
end
