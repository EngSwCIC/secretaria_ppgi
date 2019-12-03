require 'rails_helper'

RSpec.describe "faq_sugestions/new", type: :view do
  before(:each) do
    assign(:faq_sugestion, FaqSugestion.new(
      :topico => "MyText",
      :pergunta => "MyText",
      :resposta => "MyText",
      :faq => nil
    ))
  end

  it "renders new faq_sugestion form" do
    render

    assert_select "form[action=?][method=?]", faq_sugestions_path, "post" do

      assert_select "textarea[name=?]", "faq_sugestion[topico]"

      assert_select "textarea[name=?]", "faq_sugestion[pergunta]"

      assert_select "textarea[name=?]", "faq_sugestion[resposta]"

      assert_select "input[name=?]", "faq_sugestion[faq_id]"
    end
  end
end
