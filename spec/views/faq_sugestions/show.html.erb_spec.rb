require 'rails_helper'

RSpec.describe "faq_sugestions/show", type: :view do
  before(:each) do
    @faq_sugestion = assign(:faq_sugestion, FaqSugestion.create!(
      :topico => "MyText",
      :pergunta => "MyText",
      :resposta => "MyText",
      :faq => nil
    ))
  end

  it "renders attributes in <p>" do
    #render
    #expect(rendered).to match(/MyText/)
    #expect(rendered).to match(/MyText/)
    #expect(rendered).to match(/MyText/)
    #expect(rendered).to match(//)
  end
end
