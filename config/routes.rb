Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home' # Root  ‘/’   =>  'pages#home’

  resources :users, only: [:new, :create, :edit, :update]

  # Users : new, create, edit, update
  # GET    ‘/users/new’   =>   users#new’
  # POST   ‘/users'   =>   users#create’
  #  GET   ‘/users/:id/edit’   =>    users#edit’
  # PATCH   ‘/users/:id’   => users#update’

  resources :reservations, only: [:index, :new, :create]

  # Bookings: new, create, index                            (*delete)
  # GET     ‘/bookings'    =>   ‘spaces#index’
  # GET    ‘/bookings/new’   =>   ‘spaces#new’
  # POST   ‘/bookings'   =>   ‘spaces#create’

  resources :spaces, only: [:index, :new, :create, :edit, :update]

  # Spaces: new, create, index, edit, update
  # GET     ‘/spaces’    =>   ‘spaces#index’
  # GET    ‘/spaces/new’   =>   ‘spaces#new’
  # POST   ‘/spaces’   =>   ‘spaces#create’
  # GET   ‘/spaces/:id/edit’   =>    ‘spaces#edit’
  # PATCH   ‘/spaces/:id’   => ‘spaces#update’

  resources :profiles, only: [:show, :new, :create, :edit, :update]

  # profiles: new, create, index, edit, update
  # GET     ‘/profiles/:id’    =>   ‘profiles#show'
  # GET    ‘/profiles/new’   =>   ‘profiles#new’
  # POST   ‘/profiles’   =>   ‘profiles#create’
  # GET   ‘/profiles/:id/edit’   =>    ‘profiles#edit’
  # PATCH   ‘/profiles/:id’   => ‘profiles#update’
end
