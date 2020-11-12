require 'rails_helper'

RSpec.describe "activity_types/new", type: :view do
  before(:each) do
    assign(:activity_type, ActivityType.new(
      title: "MyString"
    ))
  end

  it "renders new activity_type form" do
    render

    assert_select "form[action=?][method=?]", activity_types_path, "post" do

      assert_select "input[name=?]", "activity_type[title]"
    end
  end
end
