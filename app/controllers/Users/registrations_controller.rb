# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    skip_before_action :verify_authenticity_token, only: :create

    # GET /resource/sign_up

    # POST /resource
    def create
      super
      flash[:notice] = '新規登録しました'
    end
    # GET /resource/edit

    # PUT /resource
    def update
      super
      flash[:notice] = '更新しました'
    end
    # DELETE /resource

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email phone_number birth])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    end

    # The path used after sign up.

    # The path used after sign up for inactive accounts.
  end
end
