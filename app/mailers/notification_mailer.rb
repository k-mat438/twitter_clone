# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def follows(user)
    @user = user
    mail(
      from: ENV['GMAIL_ADDRESS'],
      subject: 'Followed !',
      to: @user.email
    )
  end
end
