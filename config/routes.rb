Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home' # Root  ‘/’   =>  'pages#home’

  resources :users, only: [:new, :create, :edit, :update]

  # Users : new, create, edit, update
  # GET    ‘/users/new’   =>   users#new’
  # POST   ‘/users   =>   users#create’
  #  GET   ‘/users/:id/edit’   =>    users#edit’
  # PATCH   ‘/users/:id’   => users#update’



  resources :spaces, only: [:index, :new, :create, :edit, :update] do
    resources :reservations, only: [:index, :new, :create]
  end

  # Spaces: new, create, index, edit, update
  # GET     ‘/spaces’    =>   ‘spaces#index’
  # GET    ‘/spaces/new’   =>   ‘spaces#new’
  # POST   ‘/spaces’   =>   ‘spaces#create’
  # GET   ‘/spaces/:id/edit’   =>    ‘spaces#edit’
  # PATCH   ‘/spaces/:id’   => ‘spaces#update’
end
