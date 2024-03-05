# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_target_user, only: %i[show show_reposts show_comments show_favorites edit update]
  def show; end

  def show_reposts; end

  def show_comments; end

  def show_favorites; end

  def edit; end

  def update
    @user.update(params_user)
    redirect_to users_show_path(id: @user.id)
  end

  private

  def params_user
    params.require(:user).permit(:name, :image, :header_image, :location, :website, :birth, :introduction)
  end

  def set_target_user
    @user = User.find(params[:id])
  end
end
