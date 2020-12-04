require 'rails_helper'

RSpec.describe "diaria/new", type: :view do
  before(:each) do
    assign(:diarium, Diarium.new(
      data_entrada: "MyString",
      data_saida: "MyString"
    ))
  end

  it "renders new diarium form" do
    render

    assert_select "form[action=?][method=?]", diaria_path, "post" do

      assert_select "input[name=?]", "diarium[data_entrada]"

      assert_select "input[name=?]", "diarium[data_saida]"
    end
  end
end
