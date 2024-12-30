FactoryBot.define do
  factory :proponent do
    name { Faker::Name.name }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    income { Faker::Number.decimal(l_digits: 4, r_digits: 2) }

    after(:create) do |proponent|
      create_list(:address, 2, addressable: proponent)
      create_list(:proponent_document, 2, proponent: proponent)
      create_list(:proponent_contact, 3, proponent: proponent)
    end
  end
end
