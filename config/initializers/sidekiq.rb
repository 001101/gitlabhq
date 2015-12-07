# Custom Redis configuration
config_file = Rails.root.join('config', 'resque.yml')

resque_url = if File.exists?(config_file)
               YAML.load_file(config_file)[Rails.env]
             else
               "redis://localhost:6379"
             end

Sidekiq.configure_server do |config|
  config.redis = {
    url: resque_url,
    namespace: 'resque:gitlab'
  }

  config.server_middleware do |chain|
    chain.add Gitlab::SidekiqMiddleware::ArgumentsLogger if ENV['SIDEKIQ_LOG_ARGUMENTS']
    chain.add Gitlab::SidekiqMiddleware::MemoryKiller if ENV['SIDEKIQ_MEMORY_KILLER_MAX_RSS']
  end

  # Sidekiq-cron: load recurring jobs from schedule.yml
  schedule_file = 'config/schedule.yml'
  if File.exists?(schedule_file)
    Sidekiq::Cron::Job.load_from_hash YAML.load(ERB.new(File.read(schedule_file)).result)
  end
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: resque_url,
    namespace: 'resque:gitlab'
  }
end
