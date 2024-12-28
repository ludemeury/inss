# frozen_string_literal: true

class ProponentReport < ApplicationRecord
  validates :indicator, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
