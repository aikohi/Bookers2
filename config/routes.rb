Rails.application.routes.draw do
  get "/" => "users#top"
  get "/about" => "users#about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'

  resources :books
  resources :books, only: [:new, :create, :index, :show, :destroy, :new] do
  	resource :post_comments, only: [:create, :destroy] #コメント機能
    resource :favorites, only: [:create, :destroy]  #お気に入り
  end
  resources :users, only: [:show, :edit, :update,:index] do
    resources :favorites, only: [:index]  #お気に入り
  end
end
