require 'rails_helper'

RSpec.describe "faqs/show", type: :view do
  before(:each) do
    @faq = assign(:faq, Faq.create!(
      :Topic => "MyText",
      :Question => "MyText",
      :Answer => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
