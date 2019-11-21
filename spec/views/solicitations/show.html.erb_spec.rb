require 'rails_helper'

RSpec.describe "solicitations/show", type: :view do
  before(:each) do
    @solicitation = assign(:solicitation, Solicitation.create!(
      :kind => 2,
      :origin => "Origin",
      :destination => "Destination",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Origin/)
    expect(rendered).to match(/Destination/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
