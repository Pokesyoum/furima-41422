FactoryBot.define do
  factory :address do
    association :order
    postal_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    street { Faker::Address.street_name }
    building { Faker::Address.building_number }
    phone_number { Faker::Number.number(digits: 11) }
  end
end
