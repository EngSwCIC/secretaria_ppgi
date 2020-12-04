require 'rails_helper'

RSpec.describe "faqs/index", type: :view do
  before(:each) do
    assign(:faqs, [
      Faq.create!(
        :question => "Question",
        :answer => "Answer",
        :topic => nil
      ),
      Faq.create!(
        :question => "Question",
        :answer => "Answer",
        :topic => nil
      )
    ])
  end

  it "renders a list of faqs" do
    render
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
