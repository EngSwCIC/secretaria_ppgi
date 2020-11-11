require 'rails_helper'

RSpec.describe "wikis/edit", type: :view do
  before(:each) do
    @wiki = assign(:wiki, Wiki.create!(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit wiki form" do
    render

    assert_select "form[action=?][method=?]", wiki_path(@wiki), "post" do

      assert_select "input[name=?]", "wiki[title]"

      assert_select "textarea[name=?]", "wiki[content]"
    end
  end
end
