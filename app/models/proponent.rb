# frozen_string_literal: true

class Proponent < ApplicationRecord
  validates :name, presence: true

  validates :birthdate, presence: true

  validates :income, numericality: { greater_than: 0 }

  has_many :addresses, as: :addressable, dependent: :destroy

  has_many :documents, class_name: "ProponentDocument", dependent: :destroy

  has_many :contacts, class_name: "ProponentContact", dependent: :destroy
end
