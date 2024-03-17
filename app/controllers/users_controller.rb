# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_target_user, only: %i[show edit]
  def show
    @kind = params[:kind]
    case params[:kind]
    when 'reposts'
      @action = @user.reposts.order('created_at DESC')
    when 'comments'
      @comments = @user.comments.order('created_at DESC')
    when 'favorites'
      @action = @user.favorites.order('created_at DESC')
    else
      @posts = @user.posts.order('created_at DESC')
      @kind = 'show'
    end
  end

  # def reposts
  #   @reposts = @user.reposts.order('created_at DESC')
  # end

  # def comments
  #   # @comments = Comment.where(user_id: @user.id).order('created_at DESC')
  #   @comments = @user.comments.order('created_at DESC')
  # end

  # def favorites
  #   @favorites = @user.favorites.order('created_at DESC')
  # end

  def edit
    return if @user.id == current_user.id

    redirect_to home_path
  end

  def update
    @user = current_user
    @user.update(params_user)
    redirect_to user_path(id: @user.id)
  end

  private

  def params_user
    params.require(:user).permit(:name, :image, :header_image, :location, :website, :birth, :introduction)
  end

  def set_target_user
    @user = User.find(params[:id])
  end
end
