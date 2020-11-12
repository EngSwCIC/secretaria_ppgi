require 'rails_helper'

RSpec.describe "user_activities/new", type: :view do
  before(:each) do
    assign(:user_activity, UserActivity.new(
      user: nil,
      activity: nil,
      interested: false,
      active: false
    ))
  end

  it "renders new user_activity form" do
    render

    assert_select "form[action=?][method=?]", user_activities_path, "post" do

      assert_select "input[name=?]", "user_activity[user_id]"

      assert_select "input[name=?]", "user_activity[activity_id]"

      assert_select "input[name=?]", "user_activity[interested]"

      assert_select "input[name=?]", "user_activity[active]"
    end
  end
end
