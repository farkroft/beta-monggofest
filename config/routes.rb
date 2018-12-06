Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
 
        get 'payment_details', to: 'payment_details#index'
        get 'payment_details', to: 'payment_details#show'
        post 'payment_details', to: 'payment_details#create'
        delete 'payment_detail/:id', to: 'payment_details#destroy'
        patch 'payment_detail/:id', to: 'payment_details#update'
      end
    end
  end