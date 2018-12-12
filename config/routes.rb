 #frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pages#show', page: 'sign_in'

  namespace :api do
    namespace :v1 do      

      #payment detail
      
      get 'payment_details', to: 'payment_details#index'
      get 'payment_details/:id', to: 'payment_details#show'
      post 'payment_details', to: 'payment_details#create'
      patch 'payment_detail/:id', to: 'payment_details#update'

      get    'popularproducts',     to: 'popular_products#index'
      #user_action product_invest
    	get    'prodinvests',         to: 'product_invests#index'
    	get    'prodinvest/:id',      to: 'product_invests#show'
    	post   'prodinvest/create',   to: 'product_invests#create'
    	patch  'prodinvest/:id',      to: 'product_invests#update'
    	delete 'prodinvest/:id',      to: 'product_invests#destroy'

      #user_action product_invest_detail
      get    'proinvdetails',       to: 'product_invest_details#index'
      get    'proinvdetail/:id',    to: 'product_invest_details#show'
      post   'proinvdetail/create', to: 'product_invest_details#create'
      patch  'proinvdetail/:id',    to: 'product_invest_details#update'
      delete 'proinvdetail/:id',    to: 'product_invest_details#destroy'

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
      # routes for user investor
      get 'userinvest', to: 'user_investors#index'
      get 'userinvest/:id', to: 'user_investors#show'
      post 'userinvest', to: 'user_investors#create'
      put 'userinvest/:id', to: 'user_investors#update'
      delete 'userinvest/:id', to: 'user_investors#destroy'
     
      # User actions
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
      
      # api for slider
      get 'sliders', to: 'sliders#index'
      get 'sliders/:id', to: 'sliders#show'
      post 'sliders', to: 'sliders#create'
      put 'sliders/:id', to: 'sliders#update'
      delete 'sliders/:id', to: 'sliders#destroy'
    end
  end
end
