require 'rails_helper'

RSpec.describe "requirements/new", type: :view do
  before(:each) do
    assign(:requirement, Requirement.new(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new requirement form" do
    render

    assert_select "form[action=?][method=?]", requirements_path, "post" do

      assert_select "input[name=?]", "requirement[title]"

      assert_select "textarea[name=?]", "requirement[content]"
    end
  end
end
