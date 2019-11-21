require 'rails_helper'

RSpec.describe "information/index", type: :view do
  before(:each) do
    assign(:information, [
      Information.create!(
        :title => "Title",
        :info => "MyText"
      ),
      Information.create!(
        :title => "Title",
        :info => "MyText"
      )
    ])
  end

  it "renders a list of information" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
