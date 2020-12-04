require 'rails_helper'

RSpec.describe "faqs/edit", type: :view do
  before(:each) do
    @faq = assign(:faq, Faq.create!(
      :question => "MyString",
      :answer => "MyString",
      :topic => nil
    ))
  end

  it "renders the edit faq form" do
    render

    assert_select "form[action=?][method=?]", faq_path(@faq), "post" do

      assert_select "input[name=?]", "faq[question]"

      assert_select "input[name=?]", "faq[answer]"

      assert_select "input[name=?]", "faq[topic_id]"
    end
  end
end
