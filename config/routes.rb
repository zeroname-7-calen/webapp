Rails.application.routes.draw do

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

  resources :fishinginfos

  resources :special_issue_categories do
  #   resources :special_issues, params: :special_issue_category_id
  resources :special_issues, params: :id
  end

  resources :special_issues

end
