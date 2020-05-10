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

  # resources :users do
  #   resources :microposts, only: [:index]
  # end
# 　　上記ブロックを一時コメントアウト。以下のブロックに変更してみた（８日ＰＭ３：50）
  #
  resources :users do
      resources :microposts, only: [:index] do
      patch :like, :unlike
      get :voted
    end
  end


    # get '/index' => "microposts#index"
    # get '/:id' => "microposts#show"
    # get '/new' => "microposts#new"
    # get '/:id/edit' => "microposts#edit"
    # post "/create" => "microposts#create"
    # post "/:id/update" => "microposts#update"
    # post "/:id/destroy" => "microposts#destroy"

    resources :microposts

  # resources :microposts do
  #   patch "like", "unlike", on: :user
  #   get "voted", on: :collection
  # end


end
