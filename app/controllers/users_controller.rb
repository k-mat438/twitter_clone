# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_target_user, only: %i[show edit followings followers]
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

  def followings
    @followings = @user.followings
  end

  def followers
    @followers = @user.followers
  end

  def create_room
    @user = User.find(params[:id])
    return if @user.id == current_user.id

    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)
    if user_rooms.nil?
      # 共有ルームがないとき
      @room = Room.create
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    else
      @room = user_rooms.room
    end
    redirect_to rooms_path
  end

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
