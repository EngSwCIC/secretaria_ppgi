require 'rails_helper'
# permite trabalhar com as API, fazer chamadas
RSpec.describe "Attendances", type: :request do
  describe "GET /attendances" do
    it "works! (now write some real specs)" do
      get attendances_path
      expect(response).to have_http_status(200)
    end
  end
end

#
#
# testes que permitem que a estrutura do banco estejam corretas
RSpec.feature Attendance , type: :model do
  # exclusao de dados
  context 'when datas exists' do
    it "destroy of the data was successfully " do
      at = Attendance.create(title: "casa" , content: "boa")
      at.destroy
      expect(at.title).to eq("casa")
    end
  end

  # Teste sobre busca de dados no banco de dados
  context "files attachment" do
    it "creates a attendance with a file" do
      attendance = create(:Attendance)
      # how to create this file?
      attendance.files.attach(create_file_blob) 
      expect(attendance.files.any?).to eq(true)
    end
  end
end