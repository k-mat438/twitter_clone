# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  # サインアップ
  describe 'Create new User' do
    context 'when Form is valid' do
      before do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'systest'
        fill_in 'user[email]', with: 'systest@test.com'
        fill_in 'user[phone_number]', with: 98_765
        fill_in 'user[birth]', with: '2003-01-01'
        fill_in 'Password', with: 123_456
        fill_in 'Password confirmation', with: 123_456
      end

      it 'registers a user successfully' do
        expect { find('input[name="commit"]').click }.to change(User, :count).by(1)
      end
    end

    context 'when Form is invalid' do
      before do
        visit new_user_registration_path
        fill_in 'user[name]', with: ''
        fill_in 'user[email]', with: 'user@invalid'
        fill_in 'user[password]', with: 'foo', match: :prefer_exact
        fill_in 'user[password_confirmation]', with: 'bar', match: :prefer_exact
      end

      it 'Failed user registration' do
        find('input[name="commit"]').click
        expect(page).to have_content('error')
      end

      it 'does not register a user with missing required fields' do
        visit new_user_registration_path
        fill_in 'user[email]', with: ''
        click_button 'Sign up'
        expect(page).to have_content("can't be blank")
      end
    end
  end

  # ログイン
  describe 'Login' do
    context 'when Authentication succeeded' do
      it 'Successful login' do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
      end
    end

    context 'when Authentication Failed' do
      it 'Failed login' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'wrong@example.com'
        fill_in 'user[password]', with: 'wrongpassword'
        click_button 'ログイン'
        expect(page).to have_content('Invalid Email or password.')
      end
    end
  end
end
