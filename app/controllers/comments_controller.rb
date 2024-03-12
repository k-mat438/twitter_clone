class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(params_comment)
    if @comment.save
      redirect_to post_path(@comment.post.id)
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.delete if @comment.present?
    redirect_to home_path
  end

  private

  def params_comment
    params.require(:comment).permit(:comment_content).merge(post_id: params[:post_id])
  end
end
