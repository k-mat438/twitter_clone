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

  def destroy
    @post = Post.find(params[:id])
    @post.delete if @post.user_id == current_user.id
    redirect_to home_path
  end

  private

  def params_post
    params.require(:post).permit(:content, post_images: [])
  end
end
