Rails.application.routes.draw do
  devise_for :users
  root 'users#login'
  get '/index', to: "users#index"
  get '/sign_up', to: "users#sign_up", as: :sign_up
  get '/redirect_login_page', to: "users#redirect_login_page"
  post '/create', to: "users#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
