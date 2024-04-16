# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  # pending "add some scenarios (or delete) #{__FILE__}"
  # サインアップ
  describe 'Create new User' do
    context 'when Form is valid' do
      it 'Successful user registration' do
      end
    end

    context 'when Form is invalid' do
      it 'Failed user registration' do
      end
    end
  end

  # ログイン
  describe 'Login' do
    context 'when Authentication succeeded' do
      it 'Successful login' do
      end
    end

    context 'when Authentication Failed' do
      it 'Failed login' do
      end
    end
  end
end
