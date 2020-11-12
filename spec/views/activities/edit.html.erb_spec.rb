require 'rails_helper'

RSpec.describe "activities/edit", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      title: "MyString",
      description: "MyText",
      status: 1,
      activity_type: nil
    ))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do

      assert_select "input[name=?]", "activity[title]"

      assert_select "textarea[name=?]", "activity[description]"

      assert_select "input[name=?]", "activity[status]"

      assert_select "input[name=?]", "activity[activity_type_id]"
    end
  end
end
