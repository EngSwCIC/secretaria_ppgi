require 'rails_helper'

RSpec.describe "accreditations/index", type: :view do
  before(:each) do
    assign(:accreditations, [
      Accreditation.create!(
        :user => nil
      ),
      Accreditation.create!(
        :user => nil
      )
    ])
  end

  it "renders a list of accreditations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
