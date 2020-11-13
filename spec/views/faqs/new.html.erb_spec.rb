require 'rails_helper'

RSpec.describe "faqs/new", type: :view do
  before(:each) do
    assign(:faq, Faq.new(
      :Topic => "MyText",
      :Question => "MyText",
      :Answer => "MyText"
    ))
  end

  it "renders new faq form" do
    render

    assert_select "form[action=?][method=?]", faqs_path, "post" do

      assert_select "textarea[name=?]", "faq[Topic]"

      assert_select "textarea[name=?]", "faq[Question]"

      assert_select "textarea[name=?]", "faq[Answer]"
    end
  end
end
