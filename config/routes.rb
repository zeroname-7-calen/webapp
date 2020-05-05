Rails.application.routes.draw do

  # get 'microposts/index'
  # get 'microposts/show'
  # get 'microposts/new'
  # get 'microposts/edit'
  resources :fileuploads, only: [:index, :create, :new]

  # devise_for :users
  root "top#index"
  get "about", to: "top#about", as: "about"

  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions:      'users/sessions',
 }

  resources :articles do
    collection do
      get "search"
    end
  end

  resources :users do
    resources :microposts, only: [:index]
  end

  resources :microposts


end
