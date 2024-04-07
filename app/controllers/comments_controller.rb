# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(params_comment)
    ActiveRecord::Base.transaction do
      @comment.save!
      @post = Post.find(params[:post_id])
      @post.create_notification_comment!(current_user, @comment.id)
    end
    redirect_to post_path(@comment.post.id)
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.delete if @comment.present?
    redirect_to home_path
  end

  private

  def params_comment
    params.require(:comment).permit(:content).merge(post_id: params[:post_id])
  end
end
