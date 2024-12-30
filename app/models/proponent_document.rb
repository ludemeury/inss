# frozen_string_literal: true

class ProponentDocument < ApplicationRecord
  KINDS = %w[cpf cnh rg].freeze

  belongs_to :proponent

  validates :kind, inclusion: { in: KINDS }

  validates :document, presence: true
end
