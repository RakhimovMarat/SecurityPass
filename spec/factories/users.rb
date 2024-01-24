FactoryBot.define do
  factory :user do
    username { Faker::Superhero.name }
    email    { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
