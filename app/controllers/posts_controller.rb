# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @create_comment = Comment.new
  end

  def create
    @post = current_user.posts.build(params_post)
    return unless @post.save

    redirect_to home_path
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    if @post.present?
      @post.comments.delete_all
      @post.favorites.delete_all
      @post.reposts.delete_all
      @post.bookmarks.delete_all
      @post.notifications.delete_all
      @post.delete
    end
    redirect_to home_path
  end

  def bookmarks
    @bookmarks = current_user.bookmarks.order('created_at DESC')
  end

  private

  def params_post
    params.require(:post).permit(:content, post_images: [])
  end
end
