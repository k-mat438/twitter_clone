# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  get '/home', to: 'home#index'
  get '/following', to: 'home#following'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get 'users/show', to: 'users#show'
  get 'users/reposts', to: 'users#reposts'
  get 'users/comments', to: 'users#comments'
  get 'users/favorites', to: 'users#favorites'
  get 'users/profile_edit', to: 'users#edit'
  patch 'users/profile_edit', to: 'users#update'

  resources :posts, only: %i[new show create destroy] do
    resources :comments, only: %i[create destroy]
    resources :favorites, only: %i[create destroy]
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
