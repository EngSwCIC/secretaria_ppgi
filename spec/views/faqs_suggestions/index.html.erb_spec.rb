require 'rails_helper'

RSpec.describe "faqs_suggestions/index", type: :view do
  before(:each) do
    assign(:faqs_suggestions, [
      FaqsSuggestion.create!(
        :question => "Question",
        :answer => "Answer",
        :tropicQuestion => nil
      ),
      FaqsSuggestion.create!(
        :question => "Question",
        :answer => "Answer",
        :tropicQuestion => nil
      )
    ])
  end

  it "renders a list of faqs_suggestions" do
    render
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
