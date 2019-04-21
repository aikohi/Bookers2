Rails.application.routes.draw do
  get "/" => "users#top"
  get "/about" => "users#about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'

  resources :books
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update,:index]
end
