require 'rails_helper'

RSpec.describe "SeiProcesses", type: :request do
  describe "GET /sei_processes" do
    it "works! (now write some real specs)" do
      get sei_processes_path
      expect(response).to have_http_status(200)
    end
  end
end
