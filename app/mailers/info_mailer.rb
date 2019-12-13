class InfoMailer < ApplicationMailer
	default from: 'secretaria@gmail.com'
  layout "mailer"

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    puts @user
    puts @user.email
    mail(to: @user.email, subject: 'Welcome to My Awesome Site', body: 'Hi')
  end
end
