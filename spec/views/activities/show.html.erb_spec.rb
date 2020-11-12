require 'rails_helper'

RSpec.describe "activities/show", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      title: "Title",
      description: "MyText",
      status: 2,
      activity_type: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
