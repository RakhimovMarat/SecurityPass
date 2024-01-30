FactoryBot.define do
  factory :pass do
    visitor_firstname { Faker::Superhero.name }
    visitor_lastname  { Faker::Superhero.prefix }
    visitor_company   { Faker::Lorem.sentence(word_count: 3) }
    visit_date        { Faker::Date.between(from: '2023-01-01', to: '2024-01-01') }
    remark            { Faker::Lorem.sentence(word_count: 10) }
    identity_document { Faker::IDNumber.chilean_id }
    status            { 'created' }
  end
end
