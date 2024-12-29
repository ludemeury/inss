# frozen_string_literal: true

class Proponent < ApplicationRecord
  INSS_LEVELS = %w[inss_level_1 inss_level_2 inss_level_3 inss_level_4].freeze

  INSS_DISCOUNT_LEVEL_1 = 0.075
  INSS_LEVEL_1_LIMIT = 1_412.0

  INSS_DISCOUNT_LEVEL_2 = 0.09
  INSS_LEVEL_2_LIMIT = 2_666.68

  INSS_DISCOUNT_LEVEL_3 = 0.12
  INSS_LEVEL_3_LIMIT = 4_000.03

  INSS_DISCOUNT_LEVEL_4 = 0.14
  INSS_LEVEL_4_LIMIT = 7_786.02

  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") }
  scope :by_inss_level, ->(inss_level) { where(inss_level: inss_level) }

  before_save :save_inss_discount

  validates :name, presence: true

  validates :birthdate, presence: true

  validates :income, numericality: { greater_than: 0 }

  has_many :addresses, as: :addressable, dependent: :destroy

  has_many :documents, class_name: 'ProponentDocument', dependent: :destroy

  has_many :contacts, class_name: 'ProponentContact', dependent: :destroy

  def translated_inss_level
    I18n.t("inss_levels.#{inss_level}")
  end

  def self.calculate_inss_discount(income)
    rounded_income = income.to_d.round(2)
    return 0 if rounded_income <= 0

    # primeira faixa
    return (rounded_income * INSS_DISCOUNT_LEVEL_1).round(2) if rounded_income <= INSS_LEVEL_1_LIMIT

    first_level_discount = (INSS_LEVEL_1_LIMIT * INSS_DISCOUNT_LEVEL_1).round(2)

    # segunda faixa
    if rounded_income <= INSS_LEVEL_2_LIMIT
      return (((rounded_income - INSS_LEVEL_1_LIMIT) * INSS_DISCOUNT_LEVEL_2).round(2) + first_level_discount).round(2)
    end

    second_level_discount = ((INSS_LEVEL_2_LIMIT - INSS_LEVEL_1_LIMIT) * INSS_DISCOUNT_LEVEL_2).round(2)

    # terceira faixa
    if rounded_income <= INSS_LEVEL_3_LIMIT
      return (((rounded_income - INSS_LEVEL_2_LIMIT) * INSS_DISCOUNT_LEVEL_3).round(2) + first_level_discount + second_level_discount).round(2)
    end

    third_level_discount = ((INSS_LEVEL_3_LIMIT - INSS_LEVEL_2_LIMIT) * INSS_DISCOUNT_LEVEL_3).round(2)

    # quarta faixa
    if rounded_income <= INSS_LEVEL_4_LIMIT
      return (((rounded_income - INSS_LEVEL_3_LIMIT) * INSS_DISCOUNT_LEVEL_4).round(2) + first_level_discount + second_level_discount + third_level_discount).round(2)
    end

    fourth_level_discount = ((INSS_LEVEL_4_LIMIT - INSS_LEVEL_3_LIMIT) * INSS_DISCOUNT_LEVEL_4).round(2)

    (first_level_discount + second_level_discount + third_level_discount + fourth_level_discount).round(2)
  end

  private

    def save_inss_discount
      self.inss_discount = Proponent.calculate_inss_discount(income)
      rounded_income = income.to_d.round(2)
      self.inss_level = if rounded_income <= INSS_LEVEL_1_LIMIT
                          'inss_level_1'
                        elsif rounded_income <= INSS_LEVEL_2_LIMIT
                          'inss_level_2'
                        elsif rounded_income <= INSS_LEVEL_3_LIMIT
                          'inss_level_3'
                        else
                          'inss_level_4'
                        end
    end
end
