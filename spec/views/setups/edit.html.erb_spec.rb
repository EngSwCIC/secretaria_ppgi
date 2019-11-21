require 'rails_helper'

RSpec.describe "setups/edit", type: :view do
  before(:each) do
    @setup = assign(:setup, Setup.create!())
  end

  it "renders the edit setup form" do
    render

    assert_select "form[action=?][method=?]", setup_path(@setup), "post" do
    end
  end
end
