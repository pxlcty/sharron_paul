Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :events
  resources :details, only: [:edit, :update]

  resources :admins, only: [:show, :edit, :update]
  
  #get 'admin-login', to 'sessions#new'
  # to build : 
  #resources :media
  #resources :admin, except: [:destroy] I think... (only one user admin)
  
  #post 'admin-login', to 'sessions#create'
  #delete 'admin-logout', to 'sessions#destroy'

end
