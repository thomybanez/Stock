class UserMailer < ApplicationMailer
  def verification_email(user)
    @user = user
    mail(to: @user.email, subject: 'Verify your email')
  end
end