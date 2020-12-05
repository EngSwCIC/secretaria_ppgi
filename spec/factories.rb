FactoryBot.define do
    factory :information do
        title {'new information'}
        content {'new content'}
        source_id {1}
        published_by {0}
    end

    factory :user do
      full_name {"John Doe"}
      email {"example@user.com"}
      encrypted_password {"admin123"}
      password {"password"}
      role {"administrator"}

      trait :professor do
        email {"example@professor.com"}
        role {"professor"}
      end

      trait :student do
        email {"example@student.com"}
        role {"student"}
      end

      trait :secretary do
        email {"example@secretary.com"}
        role {"secretary"}
      end
      
    end

end



