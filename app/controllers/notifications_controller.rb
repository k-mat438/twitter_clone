# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.order(created_at: 'DESC')
    @notifications.where(checked: false).find_each do |notification|
      notification.update(checked: true)
    end
  end
end
