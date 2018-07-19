FactoryBot.define do
  factory :tweet do
    body Faker::Lorem.sentence(10)
    association :user 

    trait :invalid do
      body nil
    end
  end
end
