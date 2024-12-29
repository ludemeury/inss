# frozen_string_literal: true

class DashboardsController < ApplicationController
  def index
    @proponent_reports = ProponentReport.inss_levels.order(:indicator)

    @chart_data = {
      labels: @proponent_reports.map(&:indicator).map { |e| Proponent.translate_inss_level(e) },
      values: @proponent_reports.map(&:amount).map(&:to_i),
      label: 'Funcionários por baixa de desconto INSS'
    }
  end
end
