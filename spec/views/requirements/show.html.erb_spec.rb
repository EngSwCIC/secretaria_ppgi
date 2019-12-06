require 'rails_helper'

RSpec.describe "requirements/show", type: :view do
  let(:admin) {FactoryGirl.create :admin}
  before(:each) do
    @requirement = assign(:requirement, Requirement.create!(
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
  
  context 'when admin is not signed in' do
    it 'should not show the Edit button' do
      render
      expect(rendered).not_to have_button('Editar')
    end
  end

  context 'when admin is signed in' do
    it 'should show the Edit button' do
      sign_in admin
      render
      expect(rendered).to have_button('Editar')

    end

  end
end
