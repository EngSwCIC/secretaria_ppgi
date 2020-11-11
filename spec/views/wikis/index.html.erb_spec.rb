require 'rails_helper'

RSpec.describe "wikis/index", type: :view do
  before(:each) do
    assign(:wikis, [
      Wiki.create!(
        :title => "Title",
        :content => "MyText"
      ),
      Wiki.create!(
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of wikis" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
