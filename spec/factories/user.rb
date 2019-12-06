FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    full_name {Faker::Name.name}
    role {'student'}
  end



  factory :admin, class: User do
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    full_name {Faker::Name.name}
    role {'administrator'}

  end
end