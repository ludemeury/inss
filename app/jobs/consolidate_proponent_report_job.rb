# frozen_string_literal: true

class ConsolidateProponentReportJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    summary = Proponent.all.group(:inss_level).count
    summary.map do |indicator, amount|
      next unless  indicator

      report = ProponentReport.find_or_initialize_by(indicator: indicator)
      report.amount = amount
      report.save
    end
  end
end
