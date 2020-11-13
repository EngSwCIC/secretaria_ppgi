require 'rails_helper'

RSpec.describe "accreditations/show", type: :view do
  before(:each) do
    @accreditation = assign(:accreditation, Accreditation.create!(
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
