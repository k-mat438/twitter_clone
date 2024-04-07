# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_target_post, only: %i[create destroy]

  def create
    ActiveRecord::Base.transaction do
      @post.favorites.create!(user_id: current_user.id)
      @post.create_notification_like!(current_user)
    end
    redirect_to request.referer
  end

  def destroy
    notice = current_user.notifications.find_by(post_id: @post.id, action: 'like')
    ActiveRecord::Base.transaction do
      notice.delete if notice.present?
      @post.favorites.find_by(user_id: current_user.id).destroy!
    end
    redirect_to request.referer
  end
end
