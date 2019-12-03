FactoryBot.define do
    factory :Attendance do
        title {FFaker::Name.unique.name}
        content {FFaker::Name.name}
    end
end