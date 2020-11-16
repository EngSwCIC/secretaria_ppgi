require 'rails_helper'

RSpec.describe "faqs_suggestions/edit", type: :view do
  before(:each) do
    @faqs_suggestion = assign(:faqs_suggestion, FaqsSuggestion.create!(
      :question => "MyString",
      :answer => "MyString",
      :tropicQuestion => "MyString"
    ))
  end

  it "renders the edit faqs_suggestion form" do
    render

    assert_select "form[action=?][method=?]", faqs_suggestion_path(@faqs_suggestion), "post" do

      assert_select "input[name=?]", "faqs_suggestion[question]"

      assert_select "input[name=?]", "faqs_suggestion[answer]"

      assert_select "input[name=?]", "faqs_suggestion[tropicQuestion]"
    end
  end
end
