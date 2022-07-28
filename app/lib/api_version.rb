class ApiVersion
  attr_reader :version, :default

  def initialize (version, default = false)
    @version =  version
    @default = default
  end

  # Check whether version is specified or it is default
  def matches?(request)
    check_headers(request.headers) || default
  end

  private

  def check_headers(headers)
    # Check version from Accept headers; expect custom media types 'jobs'
    accept = headers[:accept]
    accept && accept.include?("application/vnd.jobs.#{version}+json")
  end
end
