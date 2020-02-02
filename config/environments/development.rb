Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :file_store, "#{Rails.root}/tmp/cache"
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Disable asset digests so guard livereload works
  config.assets.digest = false

  # Allow connecting to localhost via local IP address
  config.hosts.clear

  config.paperclip_defaults = {
    storage: :s3,
    preserve_files: false,
    s3_region: Rails.application.credentials.dig(:aws, :aws_region),
    s3_credentials: {
      bucket: Rails.application.credentials.dig(:aws, :s3_bucket_name),
      access_key_id: Rails.application.credentials.dig(:aws, :aws_access_key_id),
      secret_access_key: Rails.application.credentials.dig(:aws, :aws_secret_key_id)
    },
    url: ':s3_alias_url',
    path: '/production/v2/:class/:attachment/:id_partition/:style/:filename',
    s3_headers: { 'Cache-Control' => 'public, max-age=31536000' },
    s3_protocol: :https,
    s3_host_alias: 's3.amazonaws.com/labud-2010s'
    # s3_host_alias: Rails.application.credentials.dig(:asset_host).sub(/^https?:\/\//, '')
  }

  # Send deliveries in development
  # config.action_mailer.perform_deliveries = true

  # ActionMailer::Base.smtp_settings = {
  #   :port =>           Rails.application.credentials.dig(:SMTP_PORT),
  #   :address =>        Rails.application.credentials.dig(:SMTP_SERVER),
  #   :user_name =>      Rails.application.credentials.dig(:SMTP_LOGIN),
  #   :password =>       Rails.application.credentials.dig(:SMTP_PASSWORD),
  #   :domain =>         Rails.application.credentials.dig(:SMTP_DOMAIN),
  #   :authentication => :plain,
  #   :enable_starttls_auto => true
  # }
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.default(from: ENV['ACTION_MAILER_DEFAULT_FROM'] || 'TODO <todo@test.com>')
  # config.action_mailer.default_url_options = { host: ENV['DEFAULT_URL_HOST'] || 'www.test.com' }
end
