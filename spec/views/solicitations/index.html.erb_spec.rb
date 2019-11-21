require 'rails_helper'

RSpec.describe "solicitations/index", type: :view do
  before(:each) do
    assign(:solicitations, [
      Solicitation.create!(
        :kind => 2,
        :origin => "Origin",
        :destination => "Destination",
        :description => "MyText",
        :user => nil
      ),
      Solicitation.create!(
        :kind => 2,
        :origin => "Origin",
        :destination => "Destination",
        :description => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of solicitations" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
    assert_select "tr>td", :text => "Destination".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
