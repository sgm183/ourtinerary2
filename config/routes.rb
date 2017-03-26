Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to:"pages#home"

  resources :trips do
    resources :tripitems
  end

  get '/signup', to: 'users#new'
  resources :users, except: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
