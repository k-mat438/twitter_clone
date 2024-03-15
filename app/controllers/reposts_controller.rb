class RepostsController < ApplicationController
  before_action :set_target_post, only: %i[create destroy]

  def create
    @post.reposts.create(user_id: current_user.id)
    redirect_to request.referer
  end

  def destroy
    @post.reposts.find_by(user_id: current_user.id).delete
    redirect_to request.referer
  end
end
