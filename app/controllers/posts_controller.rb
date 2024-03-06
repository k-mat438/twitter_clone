# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show; end

  def create
    @post = Post.new(params_post.merge(user_id: current_user.id))
    return unless @post.save

    redirect_to home_path
  end

  def destroy; end

  private

  def params_post
    params.require(:post).permit(:content, post_images: [])
  end
end
