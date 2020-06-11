# frozen_string_literal: true
Rails.application.routes.draw do
  get('login', to: 'sessions#login')
  post('login', to: 'sessions#new')
  get('logout', to: 'sessions#delete')

  get('signup', to: 'users#new')
  post('signup', to: 'users#create')
end
