FactoryBot.define do
  factory :user do
    sequence(:email) { Faker::Internet.email }
    password '12345678'
    sequence(:name) { Faker::GameOfThrones.character }
    sequence(:username) { Faker::Lorem.word }
  end
end
