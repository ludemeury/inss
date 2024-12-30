FactoryBot.define do
  factory :proponent_contact do
    kind { ProponentContact::KINDS.sample }
    value do
      case kind
      when 'email'
        Faker::Internet.email
      when 'telefone_residencial'
        Faker::PhoneNumber.phone_number
      end
      when 'celular', 'whatsapp'
        Faker::PhoneNumber.cell_phone
      end
    end
    proponent
  end
end
