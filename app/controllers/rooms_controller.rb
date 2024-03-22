# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    @users_room = UserRoom.all
    rooms = current_user.user_rooms.pluck(:room_id)
    @entryes = UserRoom.all.where(room_id: rooms).and(UserRoom.all.where.not(user_id: current_user.id))
  end

  def show
    rooms = current_user.user_rooms.pluck(:room_id)
    @entryes = UserRoom.all.where(room_id: rooms).and(UserRoom.all.where.not(user_id: current_user.id))
    @user = User.find(params[:user_id])
    @room = Room.find(params[:id])

    @message = Message.new(room_id: params[:id])
  end
end
