# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    rooms = current_user.user_rooms.pluck(:room_id)
    @entryes = UserRoom.all.where(room_id: rooms).and(UserRoom.all.where.not(user_id: current_user.id))
    @kind = params[:kind]
    return unless params[:kind] == 'show'

    @user = User.find(params[:user_id])
    @room = Room.find(params[:id])
    @message = Message.new
  end

  def create
    message = current_user.messages.build(room_id: params[:room_id], content: params_message[:content])
    message.save
    redirect_to request.referer
  end

  private

  def params_message
    params.require(:message).permit(:content)
  end
end
