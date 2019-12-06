require 'rails_helper'

RSpec.describe "faq_sugestions/edit", type: :view do
  before(:each) do
    @faq_sugestion = assign(:faq_sugestion, FaqSugestion.create!(
      :topico => "MyText",
      :pergunta => "MyText",
      :resposta => "MyText",
      :faq => nil
    ))
  end

  it "renders the edit faq_sugestion form" do
    render

    assert_select "form[action=?][method=?]", faq_sugestion_path(@faq_sugestion), "post" do

      assert_select "textarea[name=?]", "faq_sugestion[topico]"

      assert_select "textarea[name=?]", "faq_sugestion[pergunta]"

      assert_select "textarea[name=?]", "faq_sugestion[resposta]"

      assert_select "input[name=?]", "faq_sugestion[faq_id]"
    end
  end
end
