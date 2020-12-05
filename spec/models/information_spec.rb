require 'rails_helper'

RSpec.describe Information, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it "has none to begin with" do
    expect(Information.count).to eq 0
  end

  it "has one after adding one" do
    information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
    expect(Information.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Information.count).to eq 0
  end
end
