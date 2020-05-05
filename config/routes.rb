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
  resources :items do
    resources :comments, only:[:create]
  end

  #API
  namespace :api do
    namespace :v1 do
      resources :items, only: [] do
        member do 
          post :favorite
        end
      end
    end
  end
  
end
