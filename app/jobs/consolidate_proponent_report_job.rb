class ConsolidateProponentReportJob < ApplicationJob
  queue_as :report

  def perform(*args)
    puts "Running ConsolidateProponentReportJob"
  end
end
