Rails.application.routes.draw do

  root to: 'pages#index'
  resources :ski_areas
  resources :users
  get '/login', to: 'sessions#new', as: :login

end
