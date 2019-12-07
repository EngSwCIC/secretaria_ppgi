require 'rails_helper'

RSpec.describe "information/new", type: :view do
  before(:each) do
    assign(:information, Information.new(
      :title => "MyString",
      :info => "MyText"
    ))
  end

  it "renders new information form" do
  end
end
