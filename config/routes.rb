Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#index"

  # SESSION ROUTES #
  # -------------- #
  get '/login', to: 'sessions#new', as: 'login' # login_path
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: 'delete_user_session' #delete_user_session_path

  # USERS ROUTES #
  # ------------ #
  get '/signup', to: 'users#new', as: 'signup' # signup_path
  post '/signup', to: 'users#create'

  # -------------- #
  # /blogs
  resources :users, only: [] do
    resources :blogs
  end
  ### RESTFUL ROUTES ###
  # ------------------ #
  get '/auth/facebook/callback' => 'sessions#create'
  # index show new create edit update destroy

  # blogs_path blogs_url
  # user_login_path user_login_url

  # get '/blogs', to: 'blogs#index'
  # get '/blogs/:id', to: 'blogs#show'
  # get '/blogs/new', to: 'blogs#new'
  # post '/blogs', to: 'blogs#create'
  # get '/blogs/:id/edit', to: 'blogs#edit'
  # patch '/blogs/:id', to: 'blogs#update'
  # delete '/blogs/:id', to: 'blogs#destroy'
end
