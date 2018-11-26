Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :products
      resources :product_types
      resources :provinces
        end
  end
end
