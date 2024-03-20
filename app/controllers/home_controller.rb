# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if params[:kind] == 'following'
      @posts = Post.includes(:user).where(user_id:
                    [*current_user.followings.ids]).order('created_at DESC').page(params[:page]).per(9)
    else
      @posts = Post.includes(:user).order('created_at DESC').page(params[:page]).per(9)
      @post = Post.new
    end
  end

  def top
    return unless user_signed_in?

    flash[:notice] = 'You are already signed in.'
    redirect_to home_path
  end
end
