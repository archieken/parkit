Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home' # Root  ‘/’   =>  'pages#home’
  get '/about', to: 'pages#about'

  resources :users, only: [:new, :create, :edit, :update]

  # Users : new, create, edit, update
  # GET    ‘/users/new’   =>   users#new’
  # POST   ‘/users'   =>   users#create’
  #  GET   ‘/users/:id/edit’   =>    users#edit’
  # PATCH   ‘/users/:id’   => users#update’

  resources :spaces, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :reservations, only: [:index, :new, :create]
  end

  # Spaces: new, create, index, edit, update
  # GET     ‘/spaces’    =>   ‘spaces#index’
  # GET    ‘/spaces/new’   =>   ‘spaces#new’
  # POST   ‘/spaces’   =>   ‘spaces#create’
  # GET   ‘/spaces/:id/edit’   =>    ‘spaces#edit’
  # PATCH   ‘/spaces/:id’   => ‘spaces#update’

  resources :reservations, only: [:destroy]


  resources :profiles, only: [:show, :new, :create, :edit, :update]

  # profiles: new, create, index, edit, update
  # GET     ‘/profiles/:id’    =>   ‘profiles#show'
  # GET    ‘/profiles/new’   =>   ‘profiles#new’
  # POST   ‘/profiles’   =>   ‘profiles#create’
  # GET   ‘/profiles/:id/edit’   =>    ‘profiles#edit’
  # PATCH   ‘/profiles/:id’   => ‘profiles#update’
end
