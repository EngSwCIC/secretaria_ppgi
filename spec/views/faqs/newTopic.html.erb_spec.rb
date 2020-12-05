require 'rails_helper'

RSpec.describe "topics/new", type: :view do
  before(:each) do
    assign(:faq, Faq.new(
      :title => "MyString",
      :question => nil
    ))
  end

  it "renders new faq form" do
    render

      assert_select "input[name=?]", "faq[topic_id]"
    end
end
