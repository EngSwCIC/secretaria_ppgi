require 'rails_helper'

RSpec.describe "faqs/index", type: :view do
  before(:each) do
    assign(:faqs, [
      Faq.create!(
        :Topic => "MyText",
        :Question => "MyText",
        :Answer => "MyText"
      ),
      Faq.create!(
        :Topic => "MyText",
        :Question => "MyText",
        :Answer => "MyText"
      )
    ])
  end

  it "renders a list of faqs" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
