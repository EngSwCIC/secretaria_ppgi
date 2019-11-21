require 'rails_helper'

RSpec.describe "information/new", type: :view do
  before(:each) do
    assign(:information, Information.new(
      :title => "MyString",
      :info => "MyText"
    ))
  end

  it "renders new information form" do
    render

    assert_select "form[action=?][method=?]", information_index_path, "post" do

      assert_select "input[name=?]", "information[title]"

      assert_select "textarea[name=?]", "information[info]"
    end
  end
end
