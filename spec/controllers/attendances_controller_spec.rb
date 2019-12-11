require 'rails_helper'
RSpec.feature AttendancesController , type: :controller do

    let(:valid_attributes) {
      {title:"Teste" ,content:"Tes"}
    }
    let(:valid_session) { {} }

    #Página de criar uma attendance
    describe "GET #new" do
        it "returns a success response" do
            get :new
            expect(response).to have_http_status(:success)
        end
    end
    #Deletar uma attendance
    describe "DELETE #destroy" do
        it "destroys the requested datas" do
            attendance = Attendance.create! valid_attributes
        expect {
            delete :destroy, params: {id: attendance.to_param}, session: valid_session
        }.to change(Attendance, :count).by(-1)
        end

        it "redirects to the attendances list" do
        attendance = Attendance.create! valid_attributes
        delete :destroy, params: {id: attendance.to_param}, session: valid_session
        expect(response).to redirect_to(attendances_url)
        
        end
    end
    #Fazer update de uma attendance
    describe "PUT #update" do
        context "check successfully update" do
            let(:new_attributes) {
                {
                    title:"tes",content:"te"
                }
            }

            it "updates the requested attendance" do
            attendance = Attendance.create! valid_attributes
            put :update, params: {id: attendance.to_param, attendance: new_attributes}, session: valid_session
            attendance.reload
            expect(controller.notice).to eq("Attendance was successfully updated.")
            end

            it "redirects to the attendance" do
            attendance = Attendance.create! valid_attributes
            put :update, params: {id: attendance.to_param, attendance: valid_attributes}, session: valid_session
            expect(response).to redirect_to(attendance)
            end
        end
    end

    let(:valid_attributes_search) {
        {search: "Nada"}
    }
    let(:empty_attributes_search) {
        {search: ""}
    }
    #Pagina inicial
    describe "GET #index" do
        it "sucess on index" do
            get :index
            expect(response).to have_http_status(:success)
        end
    end
    #Pesquisar uma attendance
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
end