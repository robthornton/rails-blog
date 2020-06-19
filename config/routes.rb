# frozen_string_literal: true
Rails.application.routes.draw do
  root('posts#index')

  # Blog/posts
  resources(:posts)

  # Login
  get(:login, to: 'sessions#new')
  post(:login, to: 'sessions#create')
  get(:logout, to: 'sessions#destroy')

  # Sign up
  get(:signup, to: 'users#new')

  # Stats page
  resources(:stats, only: [:create])

  # Users
  resources(:users, only: [:create])
end
