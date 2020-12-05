require 'rails_helper'

RSpec.describe "topics/show", type: :view do
  before(:each) do
    @topic = assign(:topic, Topic.create!(
      :titulo => "Titulo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Titulo/)
  end
end
