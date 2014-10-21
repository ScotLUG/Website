worker_processes Integer(ENV['WEB_CONCURRENCY'] || 3)
timeout 15
preload_app true

before_fork do
  Signal.trap 'TERM' do
    puts <<-MSG
Unicorn master intercepting TERM and sending myself QUIT instead
    MSG
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

after_fork do
  Signal.trap 'TERM' do
    puts <<-MSG
Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT
    MSG
  end

  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end
