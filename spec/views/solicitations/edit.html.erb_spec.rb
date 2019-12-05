require 'rails_helper'

RSpec.describe 'solicitations/edit', type: :view do
  let(:person) {FactoryGirl.create :user}
  let(:admin) {FactoryGirl.create :admin}
  before(:each) do
    
    @solicitation = assign(:solicitation, Solicitation.create!(
        kind: 'passagem',
        departure: '2013-02-02',
        return: '2013-02-03',
        origin: 'Origin',
        destination: 'Destination',
        description: 'MyText',
        status: 'analise',
        user: person,
        created_at: '2012-02-02',
        updated_at: '2012-02-02'

    ))
  end
  
  context 'when user is signed in as admin' do
    before do
      sign_in admin
    end
  
    it 'renders the edit solicitation form' do
      render

      assert_select 'form[action=?][method=?]', solicitation_path(@solicitation), 'post' do

        assert_select 'select[name=?]', 'solicitation[kind]'

        assert_select 'select[name=?]', 'solicitation[departure(3i)]'

        assert_select 'select[name=?]', 'solicitation[departure(2i)]'

        assert_select 'select[name=?]', 'solicitation[departure(1i)]'

        assert_select 'select[name=?]', 'solicitation[return(3i)]'

        assert_select 'select[name=?]', 'solicitation[return(2i)]'

        assert_select 'select[name=?]', 'solicitation[return(1i)]'

        assert_select 'input[name=?]', 'solicitation[origin]'

        assert_select 'input[name=?]', 'solicitation[destination]'

        assert_select 'textarea[name=?]', 'solicitation[description]'

      end
      
    end
  end
end
