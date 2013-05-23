Gauntlet::Application.routes.draw do
  get "overview/index"
  root to: redirect('/people')

  get '/login', to: 'sessions#new', as: :login
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'

  resources :people, except: :show
  resources :todos, only: :show do
    post 'complete', on: :member
    delete 'complete' => 'todos#uncomplete', as: :uncomplete, on: :member
  end
  resources :objectives, only: [:index, :new, :create, :destroy] do
    post :sort, on: :collection
  end
end
