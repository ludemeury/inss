# frozen_string_literal: true

class Address < ApplicationRecord
  KINDS = %w[residencial comercial].freeze

  belongs_to :addressable, polymorphic: true

  validates :kind, inclusion: { in: KINDS }

  validates :street, presence: true

  validates :city, presence: true

  validates :state, presence: true

  validates :zip_code, numericality: { only_integer: true }

  validates :number, presence: true

  validates :district, presence: true
end
