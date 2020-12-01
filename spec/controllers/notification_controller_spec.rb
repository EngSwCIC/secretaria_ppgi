require 'rails_helper'

RSpec.describe NotificationsController, :type => :controller do
  render_views

  before :each do
    @user = create(:user)
    sign_in @user
  end

    describe 'create new notification' do
      it 'renders the New Notification template' do
        get :new
        expect(response).to have_http_status(:ok)
      end
      it 'fills the template with new notification data and sends it to the server' do
        post :new, params: {:title => 'title', :content => 'content', :interested_group => 'Professores'}
        expect(response).to have_http_status(:ok)
      end
      it 'calls the controller method that performs notification content validation' do
        notificaiton = Notification.new(:title => 'title', :content => 'content', :interested_group => 'Professores')
        expect(notificaiton).to be_valid
      end
      it 'adds the notification to the database' do
        notificaiton = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
        expect(Notification.all).not_to be_empty
    end
  end

    describe 'add notificaiton that has already been added' do
      it 'renders the New Notification template' do
        get :new
        expect(response).to have_http_status(:ok)
      end
      it 'fills the template with notification data and sends it to the server' do
        post :new, params: {:title => 'title', :content => 'content', :interested_group => 'Professores'}
        expect(response).to have_http_status(:ok)
      end
      it 'calls the controller method that performs notification content validation' do
        notificaiton = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
        notification2 = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
        expect(notification2).not_to be_valid
      end
      it 'renders the New Notification template with an error message' do
        get :new
        notificaiton = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
        notificaiton2 = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
        expect(response.body).to match /<p class="alert">/im
      end  
    end

    describe "show notification" do
      it "shows notificaiton details" do
        notificaiton = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
        get :show, params: {id: notificaiton.id}
        expect(response).to have_http_status(:ok)
      end
    end

    describe "destroy notification" do
      it "removes notificaiton from the database" do
        notification = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
        expect(Notification.all).not_to be_empty
        delete :destroy, params: {id: notification.id}
        expect(Notification.all).to be_empty     
      end
    end

    describe "edit notification" do
      it "renders the template for editing notification with current notification data" do
        notification = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
        get :edit, params: {id: notification.id}
        expect(response).to have_http_status(:ok)
      end
    end

    describe "update notification" do
      it "updates notification in the database with new data" do
        notification = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
        new_notification = Notification.new(:title => 'new title', :content => 'new content', :interested_group => 'Estudantes')
        put :update, params: {id: notification.id, :notification => new_notification.attributes}
        expect(response).to redirect_to(notification)
      end
    end

    describe "create notification" do
      it "creates new notification and saves it in the database" do
        notification = Notification.new(:title => 'new title', :content => 'new content', :interested_group => 'Estudantes')
        post :create, params: {notification: notification.attributes}
        expect(response).to redirect_to(notifications_path)
      end
    end

    describe "show current notifications for administrators" do
      it "shows all notifications that an administrator might be interested in" do
        get :index
      end
    end

    describe "show current notifications for professors" do
      it "shows all notifications that a professor might be interested in" do
        sign_out @user
        @user = create(:user, :professor)
        sign_in @user
        get :index
      end
    end

    describe "show current notifications for students" do
      it "shows all notifications that a student might be interested in" do
        sign_out @user
        @user = create(:user, :student)
        sign_in @user
        get :index
      end
    end

    describe "show current notifications for secretaries" do
      it "shows all notifications that a secretary might be interested in" do
        sign_out @user
        @user = create(:user, :secretary)
        sign_in @user
        get :index
      end
    end

  end

