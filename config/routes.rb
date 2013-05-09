Gauntlet::Application.routes.draw do
  root 'people#index'

  get '/login', to: 'sessions#new', as: :login
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'

  resources :people, only: [:index]
  resources :objectives, only: [:index, :new]
end
