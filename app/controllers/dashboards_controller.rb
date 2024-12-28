class DashboardsController < ApplicationController
  def index
    @proponent_reports = ProponentReport.inss_levels
  end
end
