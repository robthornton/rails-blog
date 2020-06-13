# frozen_string_literal: true
Rails.application.routes.draw do
  root('post#index')

  # Blog/posts
  namespace(:post) do
    get(:new, to: 'post#new')
  end

  # Login
  get('login', to: 'sessions#login')
  post('login', to: 'sessions#new')
  get('logout', to: 'sessions#delete')

  # Sign up
  get('signup', to: 'users#new')
  post('signup', to: 'users#create')
end
