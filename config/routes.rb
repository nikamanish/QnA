Rails.application.routes.draw do
  get 'groups/new'

  get 'groups/show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'static_pages#home'
  get 'static_pages/home'

  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
  resources :groups
	  	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
