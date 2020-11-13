require 'rails_helper'

RSpec.describe "accreditations/edit", type: :view do
  before(:each) do
    @accreditation = assign(:accreditation, Accreditation.create!(
      :user => nil
    ))
  end

  it "renders the edit accreditation form" do
    render

    assert_select "form[action=?][method=?]", accreditation_path(@accreditation), "post" do

      assert_select "input[name=?]", "accreditation[user_id]"
    end
  end
end
