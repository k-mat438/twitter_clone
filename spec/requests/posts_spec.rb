# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:post_instance) { FactoryBot.create(:post, user_id: user.id) }

  describe 'GET /new' do
    it 'renders the new post page' do
      sign_in user
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'renders the show post page' do
      sign_in user
      get post_path(post_instance)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    # 投稿
    context 'with valid parameters' do
      it 'adds a post' do
        post_params = FactoryBot.attributes_for(:post)
        sign_in user
        expect do
          post posts_path, params: { post: post_params }
        end.to change(user.posts, :count).by(1)
      end
    end

    # 投稿されない時
    context 'with invalid parameters' do
      it 'does not add a post' do
        invalid_post_params = { content: '', user_id: user.id }
        sign_in user
        expect do
          post posts_path, params: { post: invalid_post_params }
        end.not_to change(user.posts, :count)
      end
    end
  end

  describe 'DELETE /delete' do
    it 'delete a post' do
      sign_in user
      delete post_path(post_instance)
      expect(response).to redirect_to(home_path)
    end
  end
end
