require "cns_brazil"

FactoryBot.define do
  factory :municipe do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    cns { CnsBrazil::Cns.generate }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    birth_date_string { Faker::Date.birthday(min_age: 18, max_age: 65).strftime('%d/%m/%Y') }
    active { [true, false].sample }

    after(:build) do |municipe|
      municipe.address ||= FactoryBot.build(:address, municipe: municipe)
    end
  end
end
