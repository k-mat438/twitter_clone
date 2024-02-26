# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC').page(params[:page]).per(9)
  end

  def following
    @posts = Post.joins(:user).where(user: { name: 'bluebird' }).order('created_at DESC').page(params[:page]).per(9)
  end

  def top
    return unless user_signed_in?

    flash[:notice] = 'You are already signed in.'
    redirect_to home_path
  end
end
