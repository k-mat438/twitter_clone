# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  get '/home', to: 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: %i[show edit update] do
    resources :relationships, only: %i[create destroy]
    get :followings, on: :member
    get :followers, on: :member
    post :create_room, on: :member
  end

  resources :posts, only: %i[new show create destroy] do
    resources :comments, only: %i[create destroy]
    resources :favorites, only: %i[create destroy]
    resources :reposts, only: %i[create destroy]
    get :bookmarks, on: :collection
    resources :bookmarks, only: %i[create destroy]
  end

  resources :rooms, only: %i[index show create]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
