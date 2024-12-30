FactoryBot.define do
  factory :proponent_document do
    kind { ProponentDocument::KINDS.sample }
    document { Faker::IdNumber.brazilian_id }
    proponent
  end
end
