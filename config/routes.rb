Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
		  #user_action product_invest
    		get    'prodinvests',         to: 'product_invests#index'
    		get    'prodinvest/:id',      to: 'product_invests#show'
    		post   'prodinvest/create',   to: 'product_invests#create'
    		patch  'prodinvest/:id',      to: 'product_invests#update'
    		delete 'prodinvest/:id',      to: 'product_invests#destroy'
#------------------------------------------------------------------------------------
	   #user_action product_invest_detail
    		get    'proinvdetails',       to: 'product_invest_details#index'
    		get    'proinvdetail/:id',    to: 'product_invest_details#show'
    		post   'proinvdetail/create', to: 'product_invest_details#create'
    		patch  'proinvdetail/:id',    to: 'product_invest_details#update'
    		delete 'proinvdetail/:id',    to: 'product_invest_details#destroy'
#------------------------------------------------------------------------------------
  	end
  end
end

