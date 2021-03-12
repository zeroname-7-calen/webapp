Rails.application.routes.draw do
  root "top#index"
  get "about", to: "top#about", as: "about"
  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"

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
  resources :fishinginfos
  resources :special_issue_categories do
    resources :special_issues, params: :id
  end
  resources :special_issues

  get "questionnaires/index", to: "questionnaires#index"
  get "questionnaires/:candidate_type", to: "questionnaires#show"

  resources :advertisements
  # resources :top_contents, only: [:show]
  resources :top_contents
  resources :cover_stories
end
