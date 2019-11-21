require 'rails_helper'

RSpec.describe "setups/index", type: :view do
  before(:each) do
    assign(:setups, [
      Setup.create!(),
      Setup.create!()
    ])
  end

  it "renders a list of setups" do
    render
  end
end
