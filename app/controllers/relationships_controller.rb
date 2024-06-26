# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      current_user.relationships.create!(follower_id: params[:user_id])
      @user = User.find(params[:user_id])
      @user.create_notification_follow!(current_user)
    end
    NotificationMailer.follows(@user).deliver_later
    redirect_to request.referer
  end

  def destroy
    current_user.relationships.find_by(follower_id: params[:user_id]).delete
    redirect_to request.referer
  end
end
