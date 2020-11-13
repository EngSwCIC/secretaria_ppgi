require 'rails_helper'

RSpec.describe "sei_processes/new", type: :view do
  before(:each) do
    assign(:sei_process, SeiProcess.new(
      :user => nil,
      :status => 1,
      :code => "MyString"
    ))
  end

  it "renders new sei_process form" do
    render

    assert_select "form[action=?][method=?]", sei_processes_path, "post" do

      assert_select "input[name=?]", "sei_process[user_id]"

      assert_select "input[name=?]", "sei_process[status]"

      assert_select "input[name=?]", "sei_process[code]"
    end
  end
end
