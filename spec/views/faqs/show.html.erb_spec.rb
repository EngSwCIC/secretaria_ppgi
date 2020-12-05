require 'rails_helper'

RSpec.describe "faqs/show", type: :view do
  before(:each) do
    @faq = assign(:faq, Faq.create!(
      :question => "Question",
      :answer => "Answer",
      :topic => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Question/)
    expect(rendered).to match(/Answer/)
    expect(rendered).to match(//)
  end
end

RSpec.describe "topics/show", type: :view do
  before(:each) do
    @faq = assign(:faq, Faq.create!(
      :question => "Question",
      :answer => "Answer",
      :topic => "Topic"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Question/)
    expect(rendered).to match(/Answer/)
    expect(rendered).to match(/Topic/)
  end
end
