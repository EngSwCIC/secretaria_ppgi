require 'rails_helper'

RSpec.describe "setups/new", type: :view do
  before(:each) do
    assign(:setup, Setup.new(inicio: '2013-03-13 13:13:13 -0300',
                    fim: '2013-03-14 13:13:13 -0300'))
  end

  it "renders new setup form" do
    render

    assert_select "form[action=?][method=?]", setups_path, "post" do
      assert_select "select[name=?]", "setup[inicio(3i)]"

      assert_select "select[name=?]", "setup[inicio(2i)]"

      assert_select "select[name=?]", "setup[inicio(1i)]"

      assert_select "select[name=?]", "setup[fim(3i)]"

      assert_select "select[name=?]", "setup[fim(2i)]"

      assert_select "select[name=?]", "setup[fim(1i)]"

    end
  end
end
