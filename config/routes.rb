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

  resources :users, only: %i[show edit update]

  resources :posts, only: %i[new show create destroy] do
    resources :comments, only: %i[create destroy]
    resources :favorites, only: %i[create destroy]
    resources :reposts, only: %i[create destroy]
    get :bookmarks, on: :collection
    resources :bookmarks, only: %i[create destroy]
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
