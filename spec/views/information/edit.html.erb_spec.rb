require 'rails_helper'

RSpec.describe "information/edit", type: :view do
  before(:each) do
    @information = assign(:information, Information.create!(
      :title => "MyString",
      :info => "MyText",
      :fonte => "MyString"
    ))
  end

  it "renders the edit information form" do
  end
end
