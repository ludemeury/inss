class DashboardsController < ApplicationController
  def index
    @proponent_reports = ProponentReport.inss_levels.order(:indicator)

    @chart_data = {
      labels: @proponent_reports.map(&:indicator).map {|e| I18n.t("inss_levels.#{e}")},
      values: @proponent_reports.map(&:amount).map(&:to_i),
      label: "Funcionários por baixa de desconto INSS"
    }
  end
end
