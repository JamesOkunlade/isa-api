class StoreMovieTitleJob < ApplicationJob
  require 'sidekiq/api'

  include ActiveJob::Status
  
  queue_as :critical

  def perform(job_id)
    job = Job.find_by(id: job_id)

    if job.nil?
      Rails.logger.info("The job to be done not found")
      return
    end

    Rails.logger.info("Running job with the id = #{job.id}")
    StoreMovie.new(job).run
  end
end
