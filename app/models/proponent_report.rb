# frozen_string_literal: true

class ProponentReport < ApplicationRecord
  INSS_LEVELS = %w[inss_level_1 inss_level_2 inss_level_3 inss_level_4].freeze

  validates :indicator, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :inss_levels, -> { where(indicator: INSS_LEVELS) }
end
