require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  before :each do
    @user = create(:user)
    sign_in @user
  end

  describe "GET #index" do
    context "as an administrator" do
    it "returns http success and renders links to creation views" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to match /Cadastrar nova informação/im
      expect(response.body).to match /Cadastrar fonte de informação/im
      expect(response.body).to match /Criar nova notificação/im
    end
  end

  context "as a non administrator user" do
    it "returns http success and does not render links to creation views" do
      sign_out @user
      @user2 = create(:user, :professor)
      sign_in @user2
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).not_to match /Cadastrar nova informação/im
      expect(response.body).not_to match /Cadastrar fonte de informação/im
      expect(response.body).not_to match /Criar nova notificação/im
    end
  end
end

end
