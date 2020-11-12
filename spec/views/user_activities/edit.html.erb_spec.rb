require 'rails_helper'

RSpec.describe "user_activities/edit", type: :view do
  before(:each) do
    @user_activity = assign(:user_activity, UserActivity.create!(
      user: nil,
      activity: nil,
      interested: false,
      active: false
    ))
  end

  it "renders the edit user_activity form" do
    render

    assert_select "form[action=?][method=?]", user_activity_path(@user_activity), "post" do

      assert_select "input[name=?]", "user_activity[user_id]"

      assert_select "input[name=?]", "user_activity[activity_id]"

      assert_select "input[name=?]", "user_activity[interested]"

      assert_select "input[name=?]", "user_activity[active]"
    end
  end
end
