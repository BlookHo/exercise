FactoryGirl.define do
  factory :user do
    username  { Faker::Name.name }
    email { Faker::Internet.email }

    trait :no_username do
      username ''
    end

    trait :user_2 do
      username 'Mike'
      email 'who@gmail.com'
    end

    trait :no_email do
      email ''
    end

  end
end