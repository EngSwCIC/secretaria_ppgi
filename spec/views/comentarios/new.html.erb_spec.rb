require 'rails_helper'

RSpec.describe "comentarios/new", type: :view do
  before(:each) do
    assign(:comentario, Comentario.new(
      :content => "MyText"
    ))
  end

  it "renders new comentario form" do
    render

    assert_select "form[action=?][method=?]", comentarios_path, "post" do

      assert_select "textarea[name=?]", "comentario[content]"
    end
  end
end
