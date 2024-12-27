# frozen_string_literal: true

class Proponent < ApplicationRecord
  before_save :save_inss_discount

  validates :name, presence: true

  validates :birthdate, presence: true

  validates :income, numericality: { greater_than: 0 }

  has_many :addresses, as: :addressable, dependent: :destroy

  has_many :documents, class_name: "ProponentDocument", dependent: :destroy

  has_many :contacts, class_name: "ProponentContact", dependent: :destroy

  def self.calculate_inss_discount(income)
    (income * 0.10).round(2)
  end

  private
  def save_inss_discount
    self.inss_discount = Proponent.calculate_inss_discount(income)
  end
end
