# frozen_string_literal: true

Rails.application.routes.draw do
<<<<<<< HEAD

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  devise_for :users
  mount RailsAdmin::Engine => '/api/v1/admin', as: 'rails_admin'

  root to: 'pages#show', page: 'sign_in'

>>>>>>> 4e2400fe37f146e142e0aeeaad6dc6a38f5c86af
  namespace :api do
  	namespace :v1 do
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
    end
  end
end 