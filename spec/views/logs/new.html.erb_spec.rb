require 'rails_helper'

RSpec.describe "logs/new", type: :view do
  before(:each) do
    assign(:log, Log.new(
      :value => "9.99",
      :description => "MyText"
    ))
  end

  it "renders new log form" do
    render

    assert_select "form[action=?][method=?]", logs_path, "post" do

      assert_select "input[name=?]", "log[value]"

      assert_select "textarea[name=?]", "log[description]"
    end
  end
end
