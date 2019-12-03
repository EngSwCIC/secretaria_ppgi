require 'rails_helper'

RSpec.describe "faq_sugestions/index", type: :view do
  before(:each) do
    assign(:faq_sugestions, [
      FaqSugestion.create!(
        :topico => "MyText",
        :pergunta => "MyText",
        :resposta => "MyText",
        :faq => nil
      ),
      FaqSugestion.create!(
        :topico => "MyText",
        :pergunta => "MyText",
        :resposta => "MyText",
        :faq => nil
      )
    ])
  end

  it "renders a list of faq_sugestions" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
