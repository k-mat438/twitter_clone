# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    current_user.relationships.create(follower_id: params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.relationships.find_by(follower_id: params[:user_id]).destroy
    redirect_to request.referer
  end
end
