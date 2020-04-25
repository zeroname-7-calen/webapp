Rails.application.routes.draw do
  # devise_for :users
  root "top#index"
  get "about", to: "top#about", as: "about"

  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions:      'users/sessions',
 }

  resources :articles

  # post "articles/:id/update" => "articles#update"
  # get "articles/:id/edit" => "articles#edit"
  # post "articles/create" => "articles#create"
  # get "article/new", to: "article#new"
  # get "articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"



  # get "index", to: "articles#index"
  # get "new", to: "articles#new"
  # get "articles/:id", to: "articles#show"
  # post "create", to: "articles#create"
  # get "articles/:id/edit", to: "articles#edit"
  # post "articles/:id", to:"articles#update"
  # post "articles/:id", to:"articles#destroy"
end
