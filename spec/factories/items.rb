FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    price
  end
end