require 'rails_helper'

RSpec.describe "diaria/edit", type: :view do
  before(:each) do
    @diarium = assign(:diarium, Diarium.create!(
      data_entrada: "MyString",
      data_saida: "MyString"
    ))
  end

  it "renders the edit diarium form" do
    render

    assert_select "form[action=?][method=?]", diarium_path(@diarium), "post" do

      assert_select "input[name=?]", "diarium[data_entrada]"

      assert_select "input[name=?]", "diarium[data_saida]"
    end
  end
end
