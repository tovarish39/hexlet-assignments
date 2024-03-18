# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def send_message
    user = { email: 'gorrus100@gmail.com' }
    UserMailer.with(user:).welcome_email.deliver_now
    redirect_to root_path
  end
end
