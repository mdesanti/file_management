# config/unicorn.rb
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 60
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  # if defined?(Resque)
  #   Resque.redis.quit
  #   Rails.logger.info("Disconnected from Redis")
  # end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  if defined?(ActiveRecord::Base)
    Rails.logger.info("After fork: Configuration establish connection")
    config = Rails.application.config.database_configuration[Rails.env]
    config['reaping_frequency'] = ENV['DB_REAP_FREQ'] || 10 # seconds
    config['pool']            = ENV['DB_POOL'] || 10
    ActiveRecord::Base.establish_connection(config)
    Rails.logger.info("After fork: Establish connection with configuration = #{config}")
  end

  # if defined?(Resque)
  #   Resque.redis = REDIS_WORKER
  #   Rails.logger.info("Connected to Redis")
  # end
end