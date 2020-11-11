require 'rails_helper'

RSpec.describe "comentarios/edit", type: :view do
  before(:each) do
    @comentario = assign(:comentario, Comentario.create!(
      :content => "MyText"
    ))
  end

  it "renders the edit comentario form" do
    render

    assert_select "form[action=?][method=?]", comentario_path(@comentario), "post" do

      assert_select "textarea[name=?]", "comentario[content]"
    end
  end
end
