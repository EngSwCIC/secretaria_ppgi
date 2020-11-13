require 'rails_helper'

RSpec.describe "accreditations/new", type: :view do
  before(:each) do
    assign(:accreditation, Accreditation.new(
      :user => nil
    ))
  end

  it "renders new accreditation form" do
    render

    assert_select "form[action=?][method=?]", accreditations_path, "post" do

      assert_select "input[name=?]", "accreditation[user_id]"
    end
  end
end
