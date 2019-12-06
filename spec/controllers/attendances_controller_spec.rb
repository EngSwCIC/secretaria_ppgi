require 'rails_helper'
RSpec.feature AttendancesController , type: :controller do


      let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }


    let(:valid_attributes_search) {
        {search: "Nada"}
    }
    let(:empty_attributes_search) {
        {search: ""}
    }


    let(:valid_session) { {} }

    describe "GET #index" do
        it "sucess on index" do
            get :index
            expect(response).to have_http_status(:success)
        end
    end

    describe "GET #show" do
    it "returns a success response" do
      attendance = Attendance.create! valid_attributes
      get :show, params: {id: attendance.to_param}, session: valid_session
      expect(notice).to eq('Attendance was successfully created.')
    end
  end

    describe "POST #search" do
        context "with valid params" do
            it "search was sucessful" do
                post :search, params: {p: valid_attributes_search}
                expect(response).to have_http_status(:found)
            end
            it "search was invalid" do
                post :search, params: {p: empty_attributes_search}
                expect(response).to have_http_status(:found)
            end
        end
    end
    describe "GET #new" do
        it "returns a success response" do
            get :new
            expect(response).to have_http_status(:success)
        end
    end

    describe "DELETE #destroy" do
    it "destroys the requested datas" do
        attendance = Attendance.create! valid_attributes
      expect {
        delete :destroy, params: {id: attendance.to_param}, session: valid_session
      }.to change(Attendance, :count).by(-1)
    end

    it "redirects to the attendances list" do
      attendance = Attendance.create! valid_attributes
      delete :destroy, params: {id: attendance.to_params}, session: valid_session
      expect(response).to redirect_to(attendances_url)
      
    end
  end
  
    context 'redirects' do
        describe 'GET #search' do
            before { get :search }

            it { should redirect_to(attendances_path) }
            it { should redirect_to(action: :index) }
        end
    end

end