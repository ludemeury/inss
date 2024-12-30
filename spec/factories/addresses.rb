FactoryBot.define do
  factory :address do
    kind { Address::KINDS.sample }
    street { Faker::Address.street_name }
    city { Faker::Address.city }
    number { Faker::Address.building_number }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip_code.scan(/\d/).join }
    district { Faker::Address.community }
    complement { Faker::Address.secondary_address }
    addressable { nil }
  end
end
