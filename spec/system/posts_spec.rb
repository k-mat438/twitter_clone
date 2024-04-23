# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    driven_by(:rack_test)
    sign_in user
    visit home_path
  end

  # pending "add some scenarios (or delete) #{__FILE__}"

  describe 'Create new post' do
    context 'when Success' do
      before do
        fill_in 'post[content]', with: 'Test Post'
        click_button 'Post'
      end

      it 'saves new post' do
        expect do
          fill_in 'post[content]', with: 'Test Post'
          click_button 'Post'
        end.to change(user.posts, :count).by(1)
      end

      it 'displays the new post' do
        expect(page).to have_content 'Test Post'
      end
    end

    context 'when Failed' do
      it 'Not save it' do
        expect do
          fill_in 'post[content]', with: ''
          click_button 'Post'
        end.to change(user.posts, :count).by(0)
      end
    end
  end

  describe 'Delete post' do
    let!(:post) { FactoryBot.create(:post, user:, content: 'Test Post') }

    it 'deltes the post' do
      expect do
        post.destroy
      end.to change(user.posts, :count).by(-1)
    end
  end
end
