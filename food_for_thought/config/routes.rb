Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/" => "home#index", as: "home"

  resources :users

  # get "/users" => "users#index"
  # post "/users" => "users#create"
  # get "/users/new" => "users#new"
  # get "/users/:id/edit" => "users#edit"
  # get "/users/:id" => "users#show"
  # put "/users/:id" => "users#update"
  # delete "/users/:id" => "users#detroy"

resources :posts

resources :comments

end
