class DisplayCurrentDatetimeJob < ApplicationJob
  include ActiveJob::Status

  queue_as :default

  def perform
    # Do something later
    current_datetime = DateTime.now
    current_datetime.strftime "%d/%m/%Y %H:%M"

    # if current_datetime.nil?
    #   Rails.logger.info("This job was created at #{current_datetime}.")
    #   return
    # end
  end
end
