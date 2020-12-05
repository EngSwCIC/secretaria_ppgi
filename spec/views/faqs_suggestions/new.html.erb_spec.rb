require 'rails_helper'

RSpec.describe "faqs_suggestions/new", type: :view do
  before(:each) do
    assign(:faqs_suggestion, FaqsSuggestion.new(
      :question => "MyString",
      :answer => "MyString",
      :topic => nil
    ))
  end

  it "renders new faqs_suggestion form" do
    render

    assert_select "form[action=?][method=?]", faqs_suggestions_path, "post" do

      assert_select "input[name=?]", "faqs_suggestion[question]"

      assert_select "input[name=?]", "faqs_suggestion[answer]"

      assert_select "input[name=?]", "faqs_suggestion[topic_id]"
    end
  end
end
