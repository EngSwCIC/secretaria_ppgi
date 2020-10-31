require 'rails_helper'

RSpec.describe Processos, type: :model do
    describe "#create" do 
        it 'should create a new process when the attributes are valid'
        it 'should not create a new process when the sei_process_code is not a valid code'
        it 'should not create a new process when there is no assigned user'
        it 'should not create a new process when the process_status_id is invalid'
        it 'should not create a new process when trying to attach an invalid file '
    end

    describe "#update" do 
        it 'should update the process when the attributes are valid'
        it 'should not update the process when the sei_process_code is not a valid code'
        it 'should not update the process when there is no assigned user'
        it 'should not update the process when the process_status_id is invalid'
        it 'should not update the process when trying to attach an invalid file'
    end
end
