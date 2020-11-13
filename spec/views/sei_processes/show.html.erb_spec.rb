require 'rails_helper'

RSpec.describe "sei_processes/show", type: :view do
  before(:each) do
    @sei_process = assign(:sei_process, SeiProcess.create!(
      :user => nil,
      :status => 2,
      :code => "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Code/)
  end
end
