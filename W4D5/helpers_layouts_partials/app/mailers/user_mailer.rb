class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: 'everybody@appacademy.com', subject: 'Welcome to My Awesome Site')
  end

  def welcome_email(user)
    # ...
  end

  # other emails...
end
