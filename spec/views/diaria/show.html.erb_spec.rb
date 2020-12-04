require 'rails_helper'

RSpec.describe "diaria/show", type: :view do
  before(:each) do
    @diarium = assign(:diarium, Diarium.create!(
      data_entrada: "Data Entrada",
      data_saida: "Data Saida"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Data Entrada/)
    expect(rendered).to match(/Data Saida/)
  end
end
