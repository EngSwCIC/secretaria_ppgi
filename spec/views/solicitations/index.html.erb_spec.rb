require 'rails_helper'

RSpec.describe "solicitations/index", type: :view do
  let(:person) {FactoryGirl.create :user}
  let(:admin) {FactoryGirl.create :admin}

  before(:each) do
    sign_in person
    @solicitation = assign(:solicitations, [
        Solicitation.create!(
            kind: 'passagem',
            departure: '2013-02-02',
            return: '2013-02-03',
            origin: "Origin",
            destination: "Destination",
            description: "MyText",
            status: 'analise',
            user: person,
            created_at: '2012-02-02',
            updated_at: '2012-02-02'
        ),
        Solicitation.create!(
            kind: 'passagem',
            departure: '2013-02-02',
            return: '2013-02-03',
            origin: "Origin",
            destination: "Destination",
            description: "MyText",
            status: 'analise',
            user: person,
            created_at: '2012-02-02',
            updated_at: '2012-02-02'
        )
    ])
  end

  it "renders a list of solicitations" do
    render
    assert_select "tr>td", text: 'Passagem'.to_s, count: 2
    assert_select "tr>td", text: '02/02/13'.to_s, count: 2
    assert_select "tr>td", text: '03/02/13'.to_s, count: 2
    assert_select "tr>td", text: "Origin".to_s, count: 2
    assert_select "tr>td", text: "Destination".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: person.full_name.to_s, count: 2
    assert_select "tr>td", text: "Em Análise".to_s, count: 2
  end

  context 'when user is signed in as admin' do
    before do
      sign_in admin
    end

    it 'should show edit and delete buttons' do
      render
      expect(rendered).to have_button('Deletar')
      expect(rendered).to have_button('Editar')
    end

  end

  context "when user is not admin" do


    it 'should not show edit and delete buttons' do
      render
      expect(rendered).not_to have_button('Deletar')
      expect(rendered).not_to have_button('Editar')

    end


    it 'does not show Prazos button' do
      render
      expect(rendered).not_to have_button('Prazos')
    end




  end
end




