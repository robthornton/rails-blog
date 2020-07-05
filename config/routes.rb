# frozen_string_literal: true
Rails.application.routes.draw do
  root('posts#index')

  # Blog/posts
  resources(:posts)
  resources(:comments, only: [:create])

  # Sessions
  get(:login, to: 'sessions#new')
  post(:login, to: 'sessions#create')
  get(:logout, to: 'sessions#destroy')

  # Sign up
  get(:signup, to: 'users#new')

  # Stats page
  get(:stats, to: 'stats#index')

  # Users
  resources(:users, only: [:create])
end
