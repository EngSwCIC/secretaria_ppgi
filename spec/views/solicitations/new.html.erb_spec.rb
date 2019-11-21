require 'rails_helper'

RSpec.describe "solicitations/new", type: :view do
  before(:each) do
    assign(:solicitation, Solicitation.new(
      :kind => 1,
      :origin => "MyString",
      :destination => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders new solicitation form" do
    render

    assert_select "form[action=?][method=?]", solicitations_path, "post" do

      assert_select "input[name=?]", "solicitation[kind]"

      assert_select "input[name=?]", "solicitation[origin]"

      assert_select "input[name=?]", "solicitation[destination]"

      assert_select "textarea[name=?]", "solicitation[description]"

      assert_select "input[name=?]", "solicitation[user_id]"
    end
  end
end
