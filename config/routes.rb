Rails.application.routes.draw do
  root "top#index"
  get "about", to: "top#about", as: "about"
end
