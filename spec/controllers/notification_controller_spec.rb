require 'rails_helper'

RSpec.describe NotificationsController, :type => :controller do
  render_views

  before :each do
    @user = create(:user)
    sign_in @user
  end

    describe 'create new notification (happy path)' do
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

    describe 'add notificaiton that has already been added (sad path)' do
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
      context "with valid notification (happy path)" do
        it "shows notificaiton details" do
          notificaiton = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
          get :show, params: {id: notificaiton.id}
          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid notification (sad path)" do
        it "raises record not found exception" do
          expect { get :show, params: {id: -1} }.to raise_exception(ActiveRecord::RecordNotFound)
        end
      end
    end

    describe "destroy notification" do
      context "with valid notification (happy path)" do
        it "removes notificaiton from the database" do
          notification = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
          expect(Notification.all).not_to be_empty
          delete :destroy, params: {id: notification.id}
          expect(Notification.all).to be_empty     
        end
      end

      context "with invalid notification (sad path)" do
        it "raises record not found exception" do
          expect { delete :destroy, params: {id: -1} }.to raise_exception(ActiveRecord::RecordNotFound)
        end
      end
    end

    describe "edit notification" do
      context "with valid notification (happy path)" do
        it "renders the template for editing notification with current notification data" do
          notification = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
          get :edit, params: {id: notification.id}
          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid notification (sad path)" do
        it "raises record not found exception" do
          expect {get :edit, params: {id: -1}}.to raise_exception(ActiveRecord::RecordNotFound)
        end
      end
    end

    describe "update notification" do
      context "with new content for notification content (happy path)" do
        it "updates notification in the database with new data" do
          notification = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
          new_notification = Notification.new(:title => 'new title', :content => 'new content', :interested_group => 'Estudantes')
          put :update, params: {id: notification.id, :notification => new_notification.attributes}
          expect(response).to redirect_to(notification)
          get :show, params: {id: notification.id}
          expect(response.body).to match /new content/im
        end
      end

      context "with content that already exists as another notification's content (sad path)" do
        it "redirects to the notifications index page without updating the notification's content" do
          notification = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
          notification2 = Notification.create(:title => 'title2', :content => 'content2', :interested_group => 'Estudantes')
          new_notification = Notification.new(:title => 'new title', :content => 'content2', :interested_group => 'Estudantes')
          put :update, params: {id: notification.id, :notification => new_notification.attributes}
          expect(response).to redirect_to(notifications_path)
          get :show, params: {id: notification.id}
          expect(response.body).to match /content/im
        end
      end
    end

    describe "create notification" do
      context "with new content for notification's body (happy path)" do
      it "creates new notification and saves it in the database" do
        notification = Notification.new(:title => 'new title', :content => 'new content', :interested_group => 'Estudantes')
        count_before = Notification.count
        post :create, params: {notification: notification.attributes}
        count_after = Notification.count
        expect(response).to redirect_to(notifications_path)
        expect(count_after).to eql(count_before+1)
      end
    end

    context "with content that already exists as another notification's body (sad path)" do
      it "redirects to the new source page without adding the notification to the database" do
        notification = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')
        count_before = Notification.count
        notification2 = Notification.new(:title => 'new title', :content => 'content', :interested_group => 'Estudantes')
        post :create, params: {notification: notification2.attributes}
        count_after = Notification.count
        expect(response).to redirect_to(new_notification_path)
        expect(count_after).to eql(count_before)
      end
    end
  end

  describe "get notification index page" do
    context "as an administrator" do
      it "displays links for creating and deleting notifications" do
        notification = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')  
        get :index
        expect(response.body).to match /Remover/im
        expect(response.body).to match /Criar notificação/im
      end
    end
  
    context "as a non administrator user" do
      it "does not display links for creating and deleting notifications" do
        sign_out @user
        @user2 = create(:user, :professor)
        sign_in @user2
        get :index
        expect(response.body).not_to match /Remover/im
        expect(response.body).not_to match /Criar notificação/im
      end
    end
  end
  
  describe "get notification edit page" do
    context "as an administrator (happy path)" do
      it "renders the edit notification page" do
        notification = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')  
        get :edit, params: {id: notification.id}
        expect(response.body).to match /Editar notificação/im
      end
    end
  
    context "as a non administrator user (sad path)" do
      it "renders the access denied page" do
        sign_out @user
        @user2 = create(:user, :professor)
        sign_in @user2
        notification = Notification.create(:title => 'title', :content => 'content', :interested_group => 'Professores')     
        get :edit, params: {id: notification.id}
        expect(response.body).to match /negado/im
        expect(response.body).not_to match /Editar notificação/im
      end
    end
  end
  
  describe "get notification creation page" do
    context "as an administrator (happy path)" do
      it "renders the create source page" do
        get :new
        expect(response.body).to match /Adicionar uma nova notificação/im
      end
    end
  
    context "as a non administrator user (sad path)" do
      it "renders the access denied page" do
        sign_out @user
        @user2 = create(:user, :professor)
        sign_in @user2
        get :new
        expect(response.body).to match /negado/im
        expect(response.body).not_to match /Adicionar uma nova notificação/im
      end
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

