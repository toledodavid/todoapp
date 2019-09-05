class WeeklyJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    @user_email = user.email
    WeeklyMailer.submission(@user_email).deliver_later(wait_until: 5.days.from_now)
  end
end
