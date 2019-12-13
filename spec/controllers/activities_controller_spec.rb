require 'rails_helper'
# require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

RSpec.describe ActivitiesController, type: :controller do
    let(:admin) { FactoryGirl.create :admin }
    let(:user) { FactoryGirl.create :user }

    let(:admin_session) { sign_in admin }
    let(:user_session) { sign_in user }
    let(:guest_session) { {} }

    describe "GET index" do
        # it "assigns @activities" do
        #     get :index
        # end

        it "renders the index view" do
            get :index
            response.should render_template :index
        end
    end

    describe "GET new" do
        it "renders the new view" do
            get :new
            response.should render_template :new
        end
    end

    describe "GET edit" do
        it "renders the edit view" do
            get :edit, params: {id: activity.id}
            expect(response).to be_sucessful
            # response.should render_template :edit
        end
    end

    describe "GET show" do
        it "assigns the requested actvity to @activity" do
            activity = Factory(:activity)
            get :show, id: activity
            assigns(:activity).should eq(activity)
        end
    end

end
