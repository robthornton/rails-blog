# frozen_string_literal: true
Rails.application.routes.draw do
  root('post#index')

  # Blog/posts
  resources(:post)

  # Login
  get('login', to: 'sessions#new')
  post('login', to: 'sessions#create')

  get('logout', to: 'sessions#destroy')

  # Sign up
  get('signup', to: 'users#new')
  post('signup', to: 'users#create')
end
