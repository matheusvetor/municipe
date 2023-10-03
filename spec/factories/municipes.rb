FactoryBot.define do
  factory :municipe do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    cns { Faker::IDNumber.brazilian_citizen_number }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    active { [true, false].sample }
  end
end
