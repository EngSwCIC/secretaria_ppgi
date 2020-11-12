require 'rails_helper'

RSpec.describe "activities/new", type: :view do
  before(:each) do
    assign(:activity, Activity.new(
      title: "MyString",
      description: "MyText",
      status: 1,
      activity_type: nil
    ))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input[name=?]", "activity[title]"

      assert_select "textarea[name=?]", "activity[description]"

      assert_select "input[name=?]", "activity[status]"

      assert_select "input[name=?]", "activity[activity_type_id]"
    end
  end
end
