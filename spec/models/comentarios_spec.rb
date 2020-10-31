require 'rails_helper'

RSpec.describe Comentario, type: :model do
    describe "#create" do 
        it "should create a process comment when the attribute are valid"
        it "should not create a process comment when the content is blank"
        it "should not create a content when the conten id too large"
    end
end
