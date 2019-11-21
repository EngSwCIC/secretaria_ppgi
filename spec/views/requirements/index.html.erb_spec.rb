require 'rails_helper'

RSpec.describe "requirements/index", type: :view do
  before(:each) do
    assign(:requirements, [
      Requirement.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Requirement.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of requirements" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
