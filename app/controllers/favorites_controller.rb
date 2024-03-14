class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # @favorite = current_user.favorites.build(post_id: @post.id)
    # @favorite.save
    @post.favorites.create(user_id: current_user.id)
    redirect_to home_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.favorites.find_by(user_id: current_user.id).delete
    redirect_to home_path
  end
end
