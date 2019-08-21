Rails.application.routes.draw do

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#index"

  # SESSION ROUTES #
  # -------------- #

  get '/login', to: 'sessions#login', as: 'login'
  post '/login', to: 'sessions#post_login'

  get '/signup', to: 'sessions#signup', as: 'signup'
  post '/signup', to: 'sessions#post_signup'

  delete '/logout', to: 'sessions#logout', as: 'destroy_session'

  # -------------- #
  # /blogs
  resources :blogs
  ### RESTFUL ROUTES ###
  # ------------------ #

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
