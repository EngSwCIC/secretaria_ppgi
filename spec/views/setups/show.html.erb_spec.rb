require 'rails_helper'

RSpec.describe "setups/show", type: :view do
  before(:each) do
    @setup = assign(:setup, Setup.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
