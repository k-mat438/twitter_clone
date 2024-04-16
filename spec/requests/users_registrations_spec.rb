# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersRegistrations', type: :request do
  # サインアップ
  describe 'GET /users/registrations' do
    it 'works! (now write some real specs)' do
      get new_user_registration_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /users/registrations' do
    it '' do
    end
  end
end
