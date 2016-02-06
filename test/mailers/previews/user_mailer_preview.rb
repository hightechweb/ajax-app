# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Call first user to preview the email and view in browser dev env
  def welcome_email_preview
  	UserMailer.welcome_email(User.first)
  end
end
