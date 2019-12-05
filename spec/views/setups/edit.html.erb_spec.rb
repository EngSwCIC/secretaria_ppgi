require 'rails_helper'

RSpec.describe "setups/edit", type: :view do
  before(:each) do
    @setup = assign(:setup, Setup.create!(inicio: '2013-03-13 13:13:13 -0300',
                                          fim: '2013-03-14 13:13:13 -0300'))
  end

  it "renders the edit setup form" do
    render

    assert_select "form[action=?][method=?]", setup_path(@setup), "post" do
      assert_select "select[name=?]", "setup[inicio(3i)]"

      assert_select "select[name=?]", "setup[inicio(2i)]"

      assert_select "select[name=?]", "setup[inicio(1i)]"

      assert_select "select[name=?]", "setup[fim(3i)]"

      assert_select "select[name=?]", "setup[fim(2i)]"

      assert_select "select[name=?]", "setup[fim(1i)]"

    end
  end
end
