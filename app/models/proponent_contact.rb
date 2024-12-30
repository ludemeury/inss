# frozen_string_literal: true

class ProponentContact < ApplicationRecord
  KINDS = %w[telefone_residencial celular whatsapp email].freeze
  belongs_to :proponent

  validates :kind, inclusion: { in: KINDS }

  validates :value, presence: true
end
