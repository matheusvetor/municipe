FactoryBot.define do
  factory :address do
    zip_code { Faker::Address.zip_code }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    ibge_code { Faker::Number.number(digits: 7) }
  end
end
