class WeeklyMailer < ApplicationMailer
  default from: 'dtoledoz0207@gmail.com'

  def submission(user_email)
    @user_email = user_email
    mail(to: @user_email, subject: 'New contact page submission')
  end
end
