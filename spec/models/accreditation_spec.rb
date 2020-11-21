require 'rails_helper'

RSpec.describe Accreditation, type: :model do
  fixtures :users

  let(:file) {
    fixture_file_upload(Rails.root.join('public', 'TestImage.png'), 'image/png')
  }

  let(:valid_prof_params) {
    {user_id: users(:admin).id, status: 'Espera', code: 0, documents: [file]}
  }
  
  let(:valid_attributes) {
    {user_id: users(:admin).id, sei_process_id: @process.id}
  }

  before(:each) do
    sign_in users(:prof)
    Current.user = users(:prof)
    @process = SeiProcess.create! valid_prof_params

    sign_out users(:prof)
    sign_in users(:admin)
    Current.user = users(:admin)
  end
  
  context "valid record" do
    it "has valid attributes" do
      expect(
        Accreditation.new(valid_attributes)
      ).to be_valid
    end
  end

  context "invalid record" do
    it "has no user" do
      expect(
        Accreditation.new(sei_process_id: @process.id)
      ).to_not be_valid
    end

    it "has no process" do
      expect(
        Accreditation.new(user_id: users(:admin).id)
      ).to_not be_valid
    end

    it "has an unavailable process" do
      Accreditation.create!(valid_attributes)
      expect(
        Accreditation.new(valid_attributes)
      ).to_not be_valid
    end

    it "has been created by a non-admin user" do
      sign_out users(:admin)
      sign_in users(:prof)
      Current.user = users(:prof)

      expect(
        Accreditation.new(valid_attributes)
      ).to_not be_valid
    end
  end
end
