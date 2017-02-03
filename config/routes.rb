Rails.application.routes.draw do
  
  get 'comments/new'
  post 'comments/new', to: 'comments#create'

  get 'joins/new'
  get 'joins/show'

  get 'invitations/new'
  post 'invitations/new'
  get 'invitations/show'

  get 'groups/new'
  get 'groups/show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'static_pages#home'
  get 'static_pages/home'

  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  post '/search', to: 'invitations#search'
  post '/group_search', to: 'joins#search'
  resources :users
  resources :groups
  resources :invitations
	resources :joins
  resources :comments
  

  post '/respond', to: 'invitations#respond'
  post '/requests', to: 'joins#respond'

  get 'posts/new'
  post 'posts/new', to: 'posts#create'
  get 'posts/show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
