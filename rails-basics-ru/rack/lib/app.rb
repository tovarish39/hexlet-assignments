# frozen_string_literal: true

require 'rack'
require_relative 'app/admin_policy'
require_relative 'app/execution_timer'
require_relative 'app/signature'
require_relative 'app/router'

module App
  def self.init
    app = Rack::Builder.new do
      use AdminPolicy
      # BEGIN
      # use ExecutionTimer
      # END
      use Signature

      run Router.new
    end
    # Rack::Handler::Thin.run app
  end
end
# App.init
