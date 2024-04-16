# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersSessions', type: :request do
  # ログイン
  describe 'GET /users/sessions' do
    it 'works! (now write some real specs)' do
      get new_user_session_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /users/sessions' do
    it '' do
    end
  end
end
