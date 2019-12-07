require 'rails_helper'

RSpec.describe "information/index", type: :view do
  before(:each) do
    assign(:information, [
      Information.create!(
        :title => "Title",
        :info => "MyText",
      :fonte => "MyString"
      ),
      Information.create!(
        :title => "Title",
        :info => "MyText",
      :fonte => "MyString"
      )
    ])
  end

  it "renders a list of information" do
    end
end
