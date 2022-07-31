module V1
  class JobsController < ApplicationController
    def create
      @job = Job.create!(job_params)
      @current_user.requests.create(method: :post, requestable_type: "Job")
      json_response(@todo, :created)
    end

    def list_jobs
      @jobs = Job.all
      QueueJobsWorker.perform_async()
      @current_user.requests.create(method: :get, requestable_type: "Job")
      json_response(@jobs, :ok)
    end

    private

    def job_params
      params.require(:job).permit(:name, :status, :priority)
    end
  end
end
