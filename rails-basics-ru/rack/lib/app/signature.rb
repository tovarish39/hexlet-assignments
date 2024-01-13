# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    hex = Digest::SHA2.hexdigest body.first
    [status, headers, body << hex]
    # END
  end
end
