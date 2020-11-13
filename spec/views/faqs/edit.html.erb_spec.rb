require 'rails_helper'

RSpec.describe "faqs/edit", type: :view do
  before(:each) do
    @faq = assign(:faq, Faq.create!(
      :Topic => "MyText",
      :Question => "MyText",
      :Answer => "MyText"
    ))
  end

  it "renders the edit faq form" do
    render

    assert_select "form[action=?][method=?]", faq_path(@faq), "post" do

      assert_select "textarea[name=?]", "faq[Topic]"

      assert_select "textarea[name=?]", "faq[Question]"

      assert_select "textarea[name=?]", "faq[Answer]"
    end
  end
end
