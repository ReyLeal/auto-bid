Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  mount ActionCable.server => '/cable'

  # get 'users/index'
  resources :bids
  # get 'users/new'
  resources :users


  resources :users do
    resources :auctions
  end
  get '/dealers/:id/auctions' => 'dealers#index'


  post '/auctions' => 'auctions#create'
  root "users#index"
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy_user'
  get '/logout_dealer' => 'sessions#destroy_dealer'

  post '/auctions' => 'auctions#create'


  get '/auctions' => 'auctions#index'
  get '/auctions/new' => 'auctions#new'

  resources :dealers

  get '/register' => 'dealers#new'
end
