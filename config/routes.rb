Rails.application.routes.draw do
  root 'users#login'
  get '/index', to: "users#index"
  get '/sign_up', to: "users#sign_up", as: :sign_up
  post '/create', to: "users#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
