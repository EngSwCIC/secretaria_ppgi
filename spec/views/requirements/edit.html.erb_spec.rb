require 'rails_helper'

RSpec.describe "requirements/edit", type: :view do
  let(:admin) {FactoryGirl.create :admin}
  before(:each) do
    @requirement = assign(:requirement, Requirement.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit requirement form" do
    render

    assert_select "form[action=?][method=?]", requirement_path(@requirement), "post" do

      assert_select "input[name=?]", "requirement[name]"

      assert_select "textarea[name=?]", "requirement[description]"
    end
  end

  it 'should render the show button' do
    render
    expect(rendered).to have_button('Mostrar')
  end


  context 'when user is signed in as admin' do
    it 'should show the edit button' do
      sign_in admin
      render
      expect(rendered).to have_button('Atualizar Requerimento')
    end
  end
end
