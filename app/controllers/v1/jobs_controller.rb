module V1
  class JobsController < ApplicationController
    def create
      @job = Job.create!(job_params)
      json_response(@todo, :created)
    end

    def list_jobs
      @jobs = Job.all
      @jobsss = QueueJobsWorker.perform_async()
      json_response(@jobs, :ok)
      # json_response(@jobs, :ok)
    end

    private

    def job_params
      params.require(:job).permit(:name, :status, :priority)
    end
  end
end
