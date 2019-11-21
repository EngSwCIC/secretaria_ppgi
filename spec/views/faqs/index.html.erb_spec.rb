require 'rails_helper'

RSpec.describe "faqs/index", type: :view do
  before(:each) do
    assign(:faqs, [
      Faq.create!(
        :topico => "MyText",
        :pergunta => "MyText",
        :resposta => "MyText"
      ),
      Faq.create!(
        :topico => "MyText",
        :pergunta => "MyText",
        :resposta => "MyText"
      )
    ])
  end

  it "renders a list of faqs" do
  end
end
