class DashboardsController < ApplicationController
  def index
    @proponent_reports = ProponentReport.inss_levels

    @chart_data = {
      labels: @proponent_reports.map(&:indicator), # X-axis labels
      values: @proponent_reports.map(&:amount).map(&:to_i),   # Y-axis data points
      label: "Funcionários por baixa de desconto INSS"
    }
  end
end
