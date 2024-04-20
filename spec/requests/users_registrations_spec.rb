# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersRegistrations', type: :request do
  # サインアップページへのアクセス
  describe 'GET /users/registrations' do
    it 'renders the sign up form' do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
    end
  end

  # サインアップ
  describe 'POST /users/registrations' do
    it 'Successfully registrations User' do
      user_params = FactoryBot.attributes_for(:user)
      post user_registration_path, params: { user: user_params }
      follow_redirect!
      expect(response).to redirect_to new_user_session_path
    end
  end
end
