Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to:"pages#home"

  resources :trips

  get '/signup', to: 'users#new'
  resources :users, except: [:new]


end
