Rails.application.routes.draw do
  resources :shots do 
  	resources :comments 
  	member do 
  		put 'like', to: "shots#like"
  		put 'unlike', to: "shots#unlike"
  	end
  end
 
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'shots#index'
  get ':user_name', to: 'profiles#show', as: :profile

  get '/users/:id', to: 'users#show'
  resources :users, only: %i[show edit update]

  as :user do
    get 'users/profile', :to => 'devise/registrations#edit'
  end
  
  resource :friendships, only: %i[create destroy]

end
