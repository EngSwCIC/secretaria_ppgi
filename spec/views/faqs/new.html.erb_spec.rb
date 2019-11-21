require 'rails_helper'

RSpec.describe "faqs/new", type: :view do
  before(:each) do
    assign(:faq, Faq.new(
      :topico => "MyText",
      :pergunta => "MyText",
      :resposta => "MyText"
    ))
  end

  it "renders new faq form" do
    render

    assert_select "form[action=?][method=?]", faqs_path, "post" do

      assert_select "textarea[name=?]", "faq[topico]"

      assert_select "textarea[name=?]", "faq[pergunta]"

      assert_select "textarea[name=?]", "faq[resposta]"
    end
  end
end
