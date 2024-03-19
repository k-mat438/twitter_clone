# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :set_target_post, only: %i[create destroy]

  def create
    @post.bookmarks.create(user_id: current_user.id)
    redirect_to request.referer
  end

  def destroy
    @post.bookmarks.find_by(user_id: current_user.id).destroy
    redirect_to request.referer
  end
end
