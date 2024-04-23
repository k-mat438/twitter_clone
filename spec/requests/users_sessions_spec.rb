# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersSessions', type: :request do
  # ログインページへのアクセス
  describe 'GET /users/sessions' do
    it 'renders the login page' do
      get new_user_session_path
      expect(response).to have_http_status(:success)
    end
  end

  # ログイン
  describe 'POST /users/sessions' do
    let(:user) { FactoryBot.create(:user) }

    context 'with valid credentials' do
      it 'allows a user with valid credentials to log in' do
        post user_session_path, params: { user: { email: user.email, password: user.password } }
        expect(response).to redirect_to(home_path)
      end
    end

    # ログイン失敗
    context 'with invalid credentials' do
      it 'Failed logs in the user' do
        post user_session_path, params: { user: { email: 'invalid@example.com', password: 'invalid_password' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  # ログアウト
  describe 'DELETE /users/sessions' do
    it 'logs out the user' do
      user = FactoryBot.create(:user)
      sign_in user
      delete destroy_user_session_path
      expect(response).to redirect_to(root_path)
    end
  end
end
