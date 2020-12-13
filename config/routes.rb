Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :events
  
  # to build : 
  #resources :media
  #resources :admin, except: [:destroy] I think... (only one user admin)
  #get 'admin-login', to 'sessions#new'
  #post 'admin-login', to 'sessions#create'
  #delete 'admin-logout', to 'sessions#destroy'

end
