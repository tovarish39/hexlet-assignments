# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #

  def welcome_email
    @url = 'http://example.com/login'
    mail(
      # to: 'gorrus100@gmail.com',
      to: email_address_with_name('gorrus100@gmail.com', '@user.name'),
      subject: 'Welcome to My Awesome Site'
    )
  end

  def account_activation
    # BEGIN

    # END
  end
end
