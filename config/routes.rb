Rails.application.routes.draw do
   # api for slider
   namespace :api do
    namespace :v1 do
      get 'sliders', to: 'slider#index'
      get 'slider/:id', to: 'slider#show'
      post 'sliders', to: 'slider#create'
      put 'slider/:id', to: 'slider#update'
      delete 'slider/:id', to: 'slider#destroy'
    end
  end
end
