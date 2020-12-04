require 'rails_helper'

RSpec.describe "diaria/index", type: :view do
  before(:each) do
    assign(:diaria, [
      Diarium.create!(
        data_entrada: "Data Entrada",
        data_saida: "Data Saida"
      ),
      Diarium.create!(
        data_entrada: "Data Entrada",
        data_saida: "Data Saida"
      )
    ])
  end

  it "renders a list of diaria" do
    render
    assert_select "tr>td", text: "Data Entrada".to_s, count: 2
    assert_select "tr>td", text: "Data Saida".to_s, count: 2
  end
end
