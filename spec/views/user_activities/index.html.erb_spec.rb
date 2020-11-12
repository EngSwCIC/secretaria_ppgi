require 'rails_helper'

RSpec.describe "user_activities/index", type: :view do
  before(:each) do
    assign(:user_activities, [
      UserActivity.create!(
        user: nil,
        activity: nil,
        interested: false,
        active: false
      ),
      UserActivity.create!(
        user: nil,
        activity: nil,
        interested: false,
        active: false
      )
    ])
  end

  it "renders a list of user_activities" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
