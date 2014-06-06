class Notifier < ActionMailer::Base
  default from: "email@skibucket.com"

  def welcome_email(user)
    @user = user
    mail( :to => @user.email, :subject => 'Thank you for opening a Ski Bucket!' )
  end

  def password_reset_email(user, token)
    @user = user
    @reset_password_token = token
    mail(to: user.email, subject: 'You have requested to reset your password')
  end
end