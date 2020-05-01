Rails.application.routes.draw do
  # get '/', to: "welcome#index" 
  root "welcome#index"
  get '/login', to: "users#login"
  delete 'logout', to: "users#logout"
  get '/sign_up', to: "users#signup"
  post '/sign_up', to: "users#registration"
end
