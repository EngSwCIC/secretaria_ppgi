require 'rails_helper'

RSpec.describe "faqs_suggestions/show", type: :view do
  before(:each) do
    @faqs_suggestion = assign(:faqs_suggestion, FaqsSuggestion.create!(
      :question => "Question",
      :answer => "Answer",
      :topic => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Question/)
    expect(rendered).to match(/Answer/)
    expect(rendered).to match(//)
  end
end
