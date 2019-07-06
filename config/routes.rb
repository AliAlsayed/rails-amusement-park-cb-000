Rails.application.routes.draw do
  root 'attractions#index'
  resources :users
  resources :attractions do
    post '/rides', to: 'rides#create'
  end

  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
end
