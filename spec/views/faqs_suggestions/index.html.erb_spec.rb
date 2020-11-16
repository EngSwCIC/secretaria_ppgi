require 'rails_helper'

RSpec.describe "faqs_suggestions/index", type: :view do
  before(:each) do
    assign(:faqs_suggestions, [
      FaqsSuggestion.create!(
        :question => "Question",
        :answer => "Answer",
        :tropicQuestion => "Tropic Question"
      ),
      FaqsSuggestion.create!(
        :question => "Question",
        :answer => "Answer",
        :tropicQuestion => "Tropic Question"
      )
    ])
  end

  it "renders a list of faqs_suggestions" do
    render
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    assert_select "tr>td", :text => "Tropic Question".to_s, :count => 2
  end
end
