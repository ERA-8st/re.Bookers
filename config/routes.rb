Rails.application.routes.draw do
  root "homes#top"
  get "home/about" => "homes#about"
  get "users" => "users#users"
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
