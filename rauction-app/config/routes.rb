Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # get 'users/index'
  #
  # get 'users/new'
resources :users

get '/signup' => 'users#new'
post '/users' => 'users#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'


end
