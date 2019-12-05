require 'rails_helper'

RSpec.describe 'solicitations/show', type: :view do
  let(:person) {FactoryGirl.create :user}
  let(:admin) {FactoryGirl.create :admin}
  before(:each) do
    @solicitation = assign(:solicitation, Solicitation.create!(kind: 'diaria',
                                                               departure: '2013-02-02',
                                                               return: '2013-02-03',
                                                               origin: 'Origin',
                                                               destination: 'Destination',
                                                               description: 'MyText',
                                                               status: 'analise',
                                                               user: person,
                                                               created_at: '2012-02-02',
                                                               updated_at: '2012-02-02'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Diária/)
    expect(rendered).to match('02/02/13')
    expect(rendered).to match('03/02/13')
    expect(rendered).to match(/Origin/)
    expect(rendered).to match(/Destination/)
    expect(rendered).to match(/MyText/)
  end

  context 'when admin is not signed in' do
    it 'does not show the edit button' do
      render
      expect(rendered).not_to have_button('Editar')
    end

  end

end


