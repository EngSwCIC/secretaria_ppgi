# factory :activity do |f|
#     f.name { Faker::Name.name }
#     f.description { Faker::Name.description }

# end

FactoryGirl.define do
    factory :admin, class: User do
        email { Faker::Internet.email }
        password { Faker::Internet.password }
        full_name { Faker::Name.name }
        role { 'administrator' }
    end

    factory :user do
        email { Faker::Internet.email }
        password { Faker::Internet.password }
        full_name { Faker::Name.name }
        role { 'student' }
    end
end