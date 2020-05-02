Rails.application.routes.draw do
  resources :categories
  # get '/', to: "welcome#index" 
  # root "welcome#index"
  root "items#index"
  #users
  get '/login', to: "users#login"
  post '/login', to: "users#sign_in"
  delete 'logout', to: "users#logout"
  get '/sign_up', to: "users#signup"
  post '/sign_up', to: "users#registration"
  
  #items
  resources :items
end
