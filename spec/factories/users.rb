FactoryGirl.define do
  factory :user do
    username  { Faker::Name.name }
    email { Faker::Internet.email }

    trait :user_2 do
      username 'Mike'
      email 'who@gmail.com'
    end

  end
end