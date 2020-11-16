require 'rails_helper'

RSpec.describe RequestType, type: :model do
  allowed_types = %w[general enroll_payment financial_assistance proficiency deadline_extension qualification credits_transfer graduation_enrollment general_enrollment]
  it "is seeded array matching expected types" do
    found_types = []
    a = RequestType.find_each do |req_type|
      found_types.append(req_type.name)
    end
    puts(found_types)
    expect(found_types).to match_array(allowed_types)
  end
end
