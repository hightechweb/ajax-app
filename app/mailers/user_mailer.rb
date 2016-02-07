class UserMailer < ApplicationMailer
  default from: "test@nitrous.io"
  
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to my RoR App")
  end
  
end
