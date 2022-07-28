class StoreMovie
  def initialize(job)
    @job = job
  end

  def run
    if @job
      update_job(2)
    end
  end

  # def initialize(movie)
  #   @movie = movie
  # end

  # def run
  #   if @movie
  #     save(@movie)
  #   end
  # end

  private

  def update_job(status)
    @job.update_columns(status: status)
  end

  # def save(movie)
  #   @movie.save!
  # end
end