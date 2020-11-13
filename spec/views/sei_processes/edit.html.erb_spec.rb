require 'rails_helper'

RSpec.describe "sei_processes/edit", type: :view do
  before(:each) do
    @sei_process = assign(:sei_process, SeiProcess.create!(
      :user => nil,
      :status => 1,
      :code => "MyString"
    ))
  end

  it "renders the edit sei_process form" do
    render

    assert_select "form[action=?][method=?]", sei_process_path(@sei_process), "post" do

      assert_select "input[name=?]", "sei_process[user_id]"

      assert_select "input[name=?]", "sei_process[status]"

      assert_select "input[name=?]", "sei_process[code]"
    end
  end
end
