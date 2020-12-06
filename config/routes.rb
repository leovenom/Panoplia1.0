Rails.application.routes.draw do
  resources :videos do 
  	resources :comments 
  	member do 
  		put 'like', to: "videos#like"
  		put 'unlike', to: "videos#unlike"
    end
  end
  
  resources :jobs
  resources :searches
  
  resources :shots do 
  	resources :comments 
  	member do 
  		put 'like', to: "shots#like"
  		put 'unlike', to: "shots#unlike"
  	end
  end
 
  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations' }
  root 'shots#index'
  get ':user_name', to: 'profiles#show', as: :profile
  get 'home/about'

  get '/users/:id', to: 'users#show'
  resources :users, only: %i[show edit update]
  
  resource :friendships, only: %i[create destroy]
  as :user do
    get 'users/profile', :to => 'devise/registrations#edit'
  end

 

end
