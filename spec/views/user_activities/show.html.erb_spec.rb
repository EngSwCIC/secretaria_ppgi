require 'rails_helper'

RSpec.describe "user_activities/show", type: :view do
  before(:each) do
    @user_activity = assign(:user_activity, UserActivity.create!(
      user: nil,
      activity: nil,
      interested: false,
      active: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
