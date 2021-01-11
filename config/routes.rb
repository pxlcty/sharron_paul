Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'archive', to: 'events#archive'
  get 'media', to: 'pages#media'

  resources :events
  resources :details, only: [:edit, :update]
  resources :admins, only: [:show, :edit, :update]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :media_categories
  resources :media_links

  # to build : 
  #resources :media
  #resources :admin, except: [:destroy] I think... (only one user admin)
  
end
