class QueueJobsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: :critical

  def perform()
    puts "================================================================================================"
    puts "Sidekiq Queue jobs worker running......"
    puts "================================================================================================"
    puts "Queues:"
    Sidekiq::Queue.new(:critical).each { |job| puts "#{job.class}: #{job.args}" }
    Sidekiq::Queue.new(:high).each { |job| puts "#{job.class}: #{job.args}" }
    Sidekiq::Queue.new(:default).each { |job| puts "#{job.class}: #{job.args}" }
    Sidekiq::Queue.new(:low).each { |job| puts "#{job.class}: #{job.args}" }
    puts "================================================================================================"
    # jobs = Sidekiq::Queue.all.each { |q| puts "#{q.name}: #{Sidekiq::Queue.new(q.name).size}" }
    jobs = Sidekiq::Queue.all.map { |q| { "#{q.name}" => "#{q.size}" } }
    puts "================================================================================================"

    if jobs.nil?
      raise "Failed"
    else
      # binding.byebug
      jobs.to_json
    end
  end
end