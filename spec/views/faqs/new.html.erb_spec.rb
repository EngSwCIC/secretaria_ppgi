require 'rails_helper'

RSpec.describe "faqs/new", type: :view do
  before(:each) do
    assign(:faq, Faq.new(
      :question => "MyString",
      :answer => "MyString",
      :topic => nil
    ))
  end

  it "renders new faq form" do
    render

    assert_select "form[action=?][method=?]", faqs_path, "post" do

      assert_select "input[name=?]", "faq[question]"

      assert_select "input[name=?]", "faq[answer]"

      assert_select "input[name=?]", "faq[topic_id]"
    end
  end
end
