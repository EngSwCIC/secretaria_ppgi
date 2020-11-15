class Request < ApplicationRecord
    has_one :request_type
    belongs_to :user_secretary
end
