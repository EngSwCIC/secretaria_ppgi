FactoryBot.define do
    factory :information do
        title {'new information'}
        content {'new content'}
        source_id {1}
        published_by {0}
    end
end

FactoryBot.define do 
    factory :user do
      full_name {"John Doe"}
      email {"example@user.com"}
      encrypted_password {""}
      password {"password"}
      role {"administrator"}
    end
  end