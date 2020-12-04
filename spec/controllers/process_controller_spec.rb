require 'rails_helper'

RSpec.describe ProcessController, type: :controller do
  let(:user) {
    test_email = "admin_test@admin.com"
    user = User.find_by(email: test_email)
    if user.nil?
      User.create(full_name: "Administrador_teste", email: test_email, password: "admin123", role: "administrator", registration: "000000000")
    else
      return user
    end
  }

  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
