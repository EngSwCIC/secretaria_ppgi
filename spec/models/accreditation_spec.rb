require 'rails_helper'

RSpec.describe Accreditation, type: :model do

  before(:each) do
  	@admin = User.find_by(email: "sower@admin.com")
    @admin = User.create!(
      full_name: "Sower",
      email: "sower@admin.com",
      password: "admin123",
      role: "administrator",
      registration: "000000000"
    ) if @admin == nil
    sign_in @admin
    Current.user = @admin


  	@sei_process = SeiProcess.create!(
  		user_id: @admin.id, 
  		code: 0,
  		documents: Rack::Test::UploadedFile.new(Rails.root.join("features/resources/ship.jpg"))
  	)
  end

  let(:valid_attributes){
  	{user_id: @admin.id, start_date: '2020-11-15', end_date: '2021-11-15', sei_process_id: @sei_process.id}
  }

  it "is valid with valid attributes" do
  	expect(Accreditation.create(valid_attributes)).to be_valid
  end

  it "is not valid with invalid role" do
  	sign_out @admin
  	Current.user = nil
  	expect(Accreditation.create(valid_attributes)).to_not be_valid
  end

  it "is not valid with start_date later than end_date" do
  	expect(Accreditation.create(user_id: @admin.id, start_date: '2021-11-15', end_date: '2020-11-15', sei_process_id: @sei_process.id)).to_not be_valid
  end

  it "is not valid with no start_date" do
  	expect(Accreditation.create(user_id: @admin.id, start_date: nil, end_date: '2020-11-15', sei_process_id: @sei_process.id)).to_not be_valid
  end

  it "is not valid with no end_date" do
  	expect(Accreditation.create(user_id: @admin.id, start_date: '2020-11-15', end_date: nil, sei_process_id: @sei_process.id)).to_not be_valid
  end

end