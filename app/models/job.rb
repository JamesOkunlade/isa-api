class Job < ApplicationRecord
  enum status: [:waiting, :done, :in_progress, :failed]
  enum priority: [:low, :default, :high, :critical]

  after_save :store_movie_title

  private

  def display_current_datetime
    DisplayCurrentDatetimeJob.perform_later(self.id)
  end

  def store_movie_title
    StoreMovieTitleJob.perform_later(self.id)
  end
end