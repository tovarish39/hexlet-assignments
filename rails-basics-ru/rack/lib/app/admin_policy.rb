# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    req = Rack::Request.new(env)
    status, headers, body = @app.call(env)
    if req.path =~ %r{^/admin}
      [403, {}, []]
    else
      [status, headers, body]
    end
    # END
  end
end
