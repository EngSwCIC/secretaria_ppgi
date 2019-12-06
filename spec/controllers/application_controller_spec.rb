require 'rails_helper'
require 'devise'

RSpec.describe ApplicationController, type: :controller do

  it 'authenticate_user' do
    user = User.create(full_name: "Administrador", email: "admin@admin.com", password: "admin123", role: "administrator", registration: "000000000")
    sign_in user
    get :authenticate_user!
    expect(response).to be_succes
  end
end