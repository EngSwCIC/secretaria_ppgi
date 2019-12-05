require 'rails_helper'

RSpec.describe "requirements/index", type: :view do
  let(:admin) {FactoryGirl.create :admin}
  before(:each) do
    assign(:requirements, [
        Requirement.create!(
            :name => "Name",
            :description => "MyText"
        ),
        Requirement.create!(
            :name => "Name",
            :description => "MyText"
        )
    ])
  end

  it "renders a list of requirements" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end

  context 'when user is not signed in as admin' do
    it 'should not show the Edit, Delete and New Requirement button' do
      render
      expect(rendered).not_to have_button('Editar')
      expect(rendered).not_to have_button('Deletar')
      expect(rendered).not_to have_button('Novo requerimento')
    end
  end

  context 'when admin is signed in' do
    it 'should show the Edit, Delete and New Requirement button' do
      sign_in admin
      render
      expect(rendered).to have_button('Editar')
      expect(rendered).to have_button('Deletar')
      expect(rendered).to have_button('Novo requerimento')
    end
  end
end