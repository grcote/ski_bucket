Rails.application.routes.draw do

  root to: 'pages#index'
  resources :ski_areas
  resources :users

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy', as: :logout

  get '/password_reset/new', to: 'password_reset#new', as: :password_reset
  post '/password_reset', to: 'password_reset#create'
  get '/password_reset', to: 'password_reset#edit', as: :edit_password_reset
  put '/password_reset', to: 'password_reset#update'

  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/dashboard', to: 'dashboard#index'
  end
end
