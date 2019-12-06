require 'rails_helper'
require 'devise'

RSpec.describe "setups/index", type: :view do
  let(:admin) {FactoryGirl.create :admin}
  before(:each) do
    sign_in admin
    assign(:setups, [
      Setup.create!(inicio: '2013-03-13 13:13:13 -0300',
                    fim: '2013-03-14 13:13:13 -0300'),
      Setup.create!(inicio: '2013-03-13 13:13:13 -0300',
                    fim: '2013-03-14 13:13:13 -0300')
    ])
  end

  it "renders a list of setups" do
    render

    assert_select "tr>td", text: '13/03/13 13:13 PM'.to_s, count: 2

    assert_select "tr>td", text: '13/03/13 13:13 PM'.to_s, count: 2

  end


end
