FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { Faker::Japanese::Name.last_name }
    first_name            { Faker::Japanese::Name.first_name }
    last_kana             { Faker::Japanese::Name.last_name(katakana: true) }
    first_kana            { Faker::Japanese::Name.first_name(katakana: true) }
    birthday              { Faker::Date.birthday }
  end
end
