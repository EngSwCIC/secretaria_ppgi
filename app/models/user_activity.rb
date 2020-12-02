class UserActivity < ApplicationRecord
	validates :user_id, presence: { message: "Usuário deve ser informado." }
    validates :activity_id, presence: { message: "Atividade deve ser informada." }

    def self.getUser(user_id)
    	User.find_by(id: user_id).full_name
    end

    def self.getActivity(activity_id)
    	Activity.find_by(id: activity_id).title
    end
end
