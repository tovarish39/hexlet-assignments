# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    time_start = Time.now.to_i
    status, headers, body = @app.call(env)
    puts body.inspect
    result_time = Time.now.to_i - time_start
    puts result_time
    [status, headers, body  << "\n" << result_time]
  end
end
