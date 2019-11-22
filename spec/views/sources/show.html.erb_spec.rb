require 'rails_helper'

RSpec.describe "sources/show", type: :view do
  before(:each) do
    @source = assign(:source, Source.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
