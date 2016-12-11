Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  mount ActionCable.server => '/cable'
  
  resources :bids
  resources :dealers
  # Nested routes for users and auctions.
  resources :users
  resources :users do
    resources :auctions
  end
  get '/dealers/:id/auctions' => 'dealers#index'
  get '/auctions/current_dealer'=> 'auctions#is_current_dealer'
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
  get '/register' => 'dealers#new'
end
