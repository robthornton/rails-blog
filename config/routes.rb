# frozen_string_literal: true
Rails.application.routes.draw do
  root('posts#index')

  # Blog/posts
  namespace(:posts) do
    get(:new, to: 'posts#new')
  end

  # Login
  get('login', to: 'sessions#login')
  post('login', to: 'sessions#new')
  get('logout', to: 'sessions#delete')

  # Sign up
  get('signup', to: 'users#new')
  post('signup', to: 'users#create')
end
