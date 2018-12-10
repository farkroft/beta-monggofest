# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  mount RailsAdmin::Engine => '/api/v1/admin', as: 'rails_admin'

  root to: 'pages#show', page: 'sign_in'

  namespace :api do
    namespace :v1 do
      # user_action product_detail
      get 'prodinvests', to: 'product_invests#index'
      get 'prodinvest/:id', to: 'product_invests#show'
      get 'proinvdetail/:id', to: 'product_invest_details#show'

      post 'password/forgot', to: 'passwords#forgot'
      post 'password/reset', to: 'passwords#reset'
      get    '/users'          => 'users#index'
      get    '/users/current'  => 'users#current'
      post   '/users/create'   => 'users#create'
      patch  '/user/:id'       => 'users#update'
      delete '/user/:id'       => 'users#destroy'
      get    'auth'            => 'home#auth'
      get 'all'                => 'home#all'
      # Get login token from Knock
      post 'user_token' => 'user_token#create'
    end
  end
end
