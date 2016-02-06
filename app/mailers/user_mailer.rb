class UserMailer < ApplicationMailer
  default from: "dan@dantrimper.com"
  
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to my RoR App")
  end
  
end
