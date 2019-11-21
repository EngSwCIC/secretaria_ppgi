require 'rails_helper'

RSpec.describe "requirements/edit", type: :view do
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
end
