Rails.application.routes.draw do
   # api for slider
   namespace :api do
    namespace :v1 do
      get 'sliders', to: 'sliders#index'
      get 'slider/:id', to: 'sliders#show'
      post 'sliders', to: 'sliders#create'
      put 'slider/:id', to: 'sliders#update'
      delete 'slider/:id', to: 'sliders#destroy'
    end
  end
end
