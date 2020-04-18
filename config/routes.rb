Rails.application.routes.draw do
  # devise_for :users
  root "top#index"
  get "about", to: "top#about", as: "about"

  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions:      'users/sessions',
 }
end
