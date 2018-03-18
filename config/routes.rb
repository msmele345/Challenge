Rails.application.routes.draw do

  ##Static home page
  root 'static_pages#home'
  ##Static Help Page displays in-App README 
  get 'static_pages/help', to: "static_pages#help"
  ##More about me:
  get 'static_pages/about', to: "static_pages#about"

  ##login/logout routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  ##RESTful Resources and Routing:
  resources :users

  resources :damage_reports, only: [:new, :create, :destroy]


end
