class UserMailer < ApplicationMailer
  default from: '99@cats.com'

  def welcome_email(user)
      @user = user
      @url  = 'http://99cats.com/session/new'
     mail(to: user.email, subject: 'Welcome to 99 Cats')
  end
end
