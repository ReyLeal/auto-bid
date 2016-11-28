Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'


  # get 'users/index'
  #
  # get 'users/new'
  resources :users

  resources :users do
    resources :auctions
  end

  post '/auctions' => 'auctions#create'
  root "users#index"
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
