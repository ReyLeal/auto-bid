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

root "users#index"
get '/signup' => 'users#new'
post '/users' => 'users#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

post '/auctions' => 'auctions#create'


get '/auctions' => 'auctions#index'
get '/auctions/new' => 'auctions#new'

resources :dealers

get '/register' => 'dealers#new'
end
