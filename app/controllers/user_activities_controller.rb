class UserActivitiesController < ApplicationController
	def index
		@user_activities = UserActivities.all
	end

	def new
	end

	def create
		@user_activity = UserActivities.new(user_activity_params)
		if @user_activity.save
			notify(@user_activity.user_id, @user_activity.activity_id, "cadastrado")
			redirect_to user_activities_path
		elsif @user_activity.errors.any?
			error(@user_activity.user_id, @user_activity.activity_id, "cadastrar")
		end
	end

	def self.create(user_id, activity_id)
		if UserActivities.find_by(user_id: user_id, activity_id: activity_id) == nil
			@user_activity = UserActivities.new
			@user_activity.user_id = user_id
			@user_activity.activity_id = activity_id
			@user_activity.interested = true
			@user_activity.active = false
			@user_activity.save!
		end
	end

	def show
		@user_activity = find
	end

	def edit
		@user_activity = find
	end

	def update
		@user_activity = find
		if @user_activity.update(update_user_activity_params)
			notify(UserActivities.getUser(@user_activity.user_id), UserActivities.getActivity(@user_activity.activity_id), "atualizado")
			redirect_to user_activities_path
		elsif @user_activity.errors.any?
			error(UserActivities.getUser(@user_activity.user_id), UserActivities.getActivity(@user_activity.activity_id), "atualizar")
		end
	end

	def destroy
		@user_activity = find
		if @user_activity.destroy
			notify(UserActivities.getUser(@user_activity.user_id), UserActivities.getActivity(@user_activity.activity_id), "deletado")
			redirect_to user_activities_path
		elsif @user_activity.errors.any?
			error(UserActivities.getUser(@user_activity.user_id), UserActivities.getActivity(@user_activity.activity_id), "deletar")
		end
	end

	private
		def user_activity_params
			params.require(:user_activity).permit(:user_id, :activity_id)
		end

		def update_user_activity_params
			params.require(:user_activity).permit(:user_id, :activity_id, :interested, :active)
		end

		def find
			UserActivities.find(params[:id])
		end

		def notify(name, title, msg)
			flash[:notice] = "#{title} #{msg} de #{name} com sucesso"
		end

		def error(name, title, msg) 
			flash[:notice] = "Não foi possível #{msg} #{name} de #{title}"
		end
end
