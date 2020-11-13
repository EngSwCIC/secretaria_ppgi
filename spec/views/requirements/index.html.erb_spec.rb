require 'rails_helper'

RSpec.describe "requirements/index", type: :view do
  before(:each) do
    assign(:requirements, [
      Requirement.create!(
        :title => "Title",
        :content => "MyText"
      ),
      Requirement.create!(
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of requirements" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
