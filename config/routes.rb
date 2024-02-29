# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  get '/home', to: 'home#index'
  get '/following', to: 'home#following'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  get 'users/show' => 'users#show'
  get 'users/show_reposts' => 'users#show_reposts'
  get 'users/show_comments' => 'users#show_comments'
  get 'users/show_favorites' => 'users#show_favorites'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
