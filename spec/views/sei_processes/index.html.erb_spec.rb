require 'rails_helper'

RSpec.describe "sei_processes/index", type: :view do
  before(:each) do
    assign(:sei_processes, [
      SeiProcess.create!(
        :user => nil,
        :status => 2,
        :code => "Code"
      ),
      SeiProcess.create!(
        :user => nil,
        :status => 2,
        :code => "Code"
      )
    ])
  end

  it "renders a list of sei_processes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
