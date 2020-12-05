require 'rails_helper'

RSpec.describe "topics/index", type: :view do
  before(:each) do
    assign(:topics, [
      Topic.create!(
        :titulo => "Titulo"
      ),
      Topic.create!(
        :titulo => "Titulo"
      )
    ])
  end

  it "renders a list of topics" do
    render
    assert_select "tr>td", :text => "Titulo".to_s, :count => 2
  end
end
