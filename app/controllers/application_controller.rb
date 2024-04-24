# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email phone_number birth])
  end

  def after_sign_in_path_for(_resource)
    home_path
  end

  def set_target_post
    @post = Post.find(params[:post_id])
  end
end
