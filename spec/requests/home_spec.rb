# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /index' do
    # ログインしているとき
    context 'when an authorized user' do
      let(:user) { FactoryBot.create(:user) }

      it 'returns http success' do
        sign_in user
        get '/home'
        expect(response).to have_http_status(:success)
      end
    end

    # 未ログイン
    context 'when a guest' do
      it 'returns a 302 response' do
        get '/home'
        expect(response).to have_http_status :found
      end

      it 'redirects to the sign-in page' do
        get '/home'
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
