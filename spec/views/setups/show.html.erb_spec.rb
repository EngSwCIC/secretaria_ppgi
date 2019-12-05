require 'rails_helper'

RSpec.describe "setups/show", type: :view do
  let(:person) {FactoryGirl.create :user}
  before(:each) do
    sign_in person
    @setup = assign(:setup, Setup.create!(inicio: '2013-03-13 13:13:13 -0300',
                                          fim: '2013-03-14 13:13:13 -0300'))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match('13/03/13 13:13 PM')
    expect(rendered).to match('14/03/13 13:13 PM')
  end
end
