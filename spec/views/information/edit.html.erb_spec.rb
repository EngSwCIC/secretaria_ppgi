require 'rails_helper'

RSpec.describe "information/edit", type: :view do
  before(:each) do
    @information = assign(:information, Information.create!(
      :title => "MyString",
      :info => "MyText"
    ))
  end

  it "renders the edit information form" do
    render

    assert_select "form[action=?][method=?]", information_path(@information), "post" do

      assert_select "input[name=?]", "information[title]"

      assert_select "textarea[name=?]", "information[info]"
    end
  end
end
