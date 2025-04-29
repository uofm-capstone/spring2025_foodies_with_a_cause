require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Reload application's code on every request (good for development)
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # File uploads (local for development)
  config.active_storage.service = :local

  # Mailer Settings - USE LETTER_OPENER in development
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.perform_deliveries = true
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Print deprecation warnings
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  # Error if there are pending migrations
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  # Quiet asset logs
  config.assets.quiet = true

  # Raises error for missing translations (optional)
  # config.i18n.raise_on_missing_translations = true

  # Allow Action Cable to connect from any origin (optional for testing)
  # config.action_cable.disable_request_forgery_protection = true
end
