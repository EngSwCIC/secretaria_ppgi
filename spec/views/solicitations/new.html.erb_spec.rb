require 'rails_helper'

RSpec.describe "solicitations/new", type: :view do
  let(:person) {FactoryGirl.create :user}
  before(:each) do
    sign_in person
    assign(:solicitation, Solicitation.new(
        kind: 'diaria',
        departure: '2013-02-02',
        return: '2013-02-03',
        origin: "Origin",
        destination: "Destination",
        description: "MyText",
        status: 'analise',
        user: person,
        created_at: '2012-02-02',
        updated_at: '2012-02-02'

    ))
  end

  it "renders new solicitation form" do
    render

    assert_select "form[action=?][method=?]", solicitations_path, "post" do

      assert_select "select[name=?]", "solicitation[kind]"

      assert_select "select[name=?]", "solicitation[departure(3i)]"

      assert_select "select[name=?]", "solicitation[departure(2i)]"

      assert_select "select[name=?]", "solicitation[departure(1i)]"

      assert_select "select[name=?]", "solicitation[return(3i)]"

      assert_select "select[name=?]", "solicitation[return(2i)]"

      assert_select "select[name=?]", "solicitation[return(1i)]"

      assert_select "input[name=?]", "solicitation[origin]"

      assert_select "input[name=?]", "solicitation[destination]"

      assert_select "textarea[name=?]", "solicitation[description]"

    end
  end
end
