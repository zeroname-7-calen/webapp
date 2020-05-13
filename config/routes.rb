Rails.application.routes.draw do

  # get 'messages/index'
  # get 'messages/show'
  # get 'messages/new'
  # get 'messages/edit'
  resources :fileuploads, only: [:index, :create, :new]

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
      resources :messages, only: [:index]
      resources :microposts, only: [:index] do
      patch :like, :unlike
      get :voted
    end
  end

  resources :microposts

  resources :messages

end
