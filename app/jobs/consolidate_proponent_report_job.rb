class ConsolidateProponentReportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Running ConsolidateProponentReportJob"
  end
end
