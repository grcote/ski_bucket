Rails.application.routes.draw do

  root to: 'pages#index'
  #resources :ski_areas
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

    get '/ski_areas', to: 'ski_areas#index'
    get '/ski_areas/new', to: 'ski_areas#new', as: :new_ski_area
    get '/ski_areas/:id', to: 'ski_areas#show', as: :ski_area
    post '/ski_areas', to: 'ski_areas#create'
    get '/ski_areas/:id/edit', to: 'ski_areas#edit', as: :edit_ski_area
    put '/ski_areas/:id', to: 'ski_areas#update'
    delete '/ski_areas/:id', to: 'ski_areas#destroy'
    post '/ski_areas/upload', to: 'ski_areas#upload', as: :upload_ski_areas
  end
end
