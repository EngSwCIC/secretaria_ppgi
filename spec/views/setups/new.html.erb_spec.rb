require 'rails_helper'

RSpec.describe "setups/new", type: :view do
  before(:each) do
    assign(:setup, Setup.new())
  end

  it "renders new setup form" do
    render

    assert_select "form[action=?][method=?]", setups_path, "post" do
    end
  end
end
