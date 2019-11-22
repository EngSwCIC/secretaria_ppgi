require 'rails_helper'

RSpec.describe "sources/edit", type: :view do
  before(:each) do
    @source = assign(:source, Source.create!(
      :title => "MyString"
    ))
  end

  it "renders the edit source form" do
    render

    assert_select "form[action=?][method=?]", source_path(@source), "post" do

      assert_select "input[name=?]", "source[title]"
    end
  end
end
