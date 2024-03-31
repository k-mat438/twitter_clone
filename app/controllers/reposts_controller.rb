# frozen_string_literal: true

class RepostsController < ApplicationController
  before_action :set_target_post, only: %i[create destroy]

  def create
    @post.reposts.create(user_id: current_user.id)
    @post.create_notification_repost!(current_user)
    redirect_to request.referer
  end

  def destroy
    notice = current_user.notifications.find_by(post_id: @post.id, action: 'repost')
    notice.delete if notice.present?
    @post.reposts.find_by(user_id: current_user.id).delete
    redirect_to request.referer
  end
end
