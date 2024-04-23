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
    context 'with valid parameters' do
      it 'successfully registers a user' do
        user_params = FactoryBot.attributes_for(:user)
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by(1)
      end
    end

    # サインアップ失敗の場合
    context 'with invalid parameters' do
      let(:user_params) { FactoryBot.attributes_for(:user, email: nil) }

      it 'does not register a user' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.not_to change(User, :count)
      end

      it 'returns an unprocessable entity status' do
        post user_registration_path, params: { user: user_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
