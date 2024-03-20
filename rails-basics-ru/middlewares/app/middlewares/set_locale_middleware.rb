# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    req = Rack::Request.new(env)
    locale = req.env["HTTP_ACCEPT_LANGUAGE"]&.scan(/^[a-z]{2}/)&.first&.to_sym || I18n.default_locale
    I18n.locale = locale

    @app.call(env)

  end
end
