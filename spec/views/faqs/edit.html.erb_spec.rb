require 'rails_helper'

RSpec.describe "faqs/edit", type: :view do
  before(:each) do
    @faq = assign(:faq, Faq.create!(
      :topico => "MyText",
      :pergunta => "MyText",
      :resposta => "MyText"
    ))
  end

  it "renders the edit faq form" do
    render

    assert_select "form[action=?][method=?]", faq_path(@faq), "post" do

      assert_select "textarea[name=?]", "faq[topico]"

      assert_select "textarea[name=?]", "faq[pergunta]"

      assert_select "textarea[name=?]", "faq[resposta]"
    end
  end
end
