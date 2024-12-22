class Proponent < ApplicationRecord
  has_many :addresses, as: :addressable, dependent: :destroy
end
