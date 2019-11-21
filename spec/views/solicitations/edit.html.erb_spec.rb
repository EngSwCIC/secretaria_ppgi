require 'rails_helper'

RSpec.describe "solicitations/edit", type: :view do
  before(:each) do
    @solicitation = assign(:solicitation, Solicitation.create!(
      :kind => 1,
      :origin => "MyString",
      :destination => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit solicitation form" do
    render

    assert_select "form[action=?][method=?]", solicitation_path(@solicitation), "post" do

      assert_select "input[name=?]", "solicitation[kind]"

      assert_select "input[name=?]", "solicitation[origin]"

      assert_select "input[name=?]", "solicitation[destination]"

      assert_select "textarea[name=?]", "solicitation[description]"

      assert_select "input[name=?]", "solicitation[user_id]"
    end
  end
end
