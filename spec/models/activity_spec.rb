require 'rails_helper'

RSpec.describe Activity, type: :model do
    context 'valid accreditation' do
        it 'has a known status and has documents'
    end

    context 'invalid accreditation' do
        it 'has no status'
        it 'has an unknown status'
        it 'has no documents'
    end
end
