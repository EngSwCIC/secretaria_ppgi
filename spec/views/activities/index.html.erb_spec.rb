require 'rails_helper'

RSpec.describe "activities/index", type: :view do
  before(:each) do
    assign(:activities, [
      Activity.create!(
        title: "Title",
        description: "MyText",
        status: 2,
        activity_type: nil
      ),
      Activity.create!(
        title: "Title",
        description: "MyText",
        status: 2,
        activity_type: nil
      )
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
