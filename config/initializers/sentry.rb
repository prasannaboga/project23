Sentry.init do |config|
  config.dsn = ENV.fetch("SENTRY_DSN", nil)
  config.breadcrumbs_logger = %i[active_support_logger]
  config.enabled_environments = %w[development production]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.sample_rate = 0.1
  config.traces_sample_rate = 0.1
  # or
  # config.traces_sampler = lambda do |_context|
  #   true
  # end

  config.backtrace_cleanup_callback = lambda do |backtrace|
    Rails.backtrace_cleaner.clean(backtrace)
  end

  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
