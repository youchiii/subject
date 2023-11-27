Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  #get 'homes/top'
  devise_for :users
  get "subjects/top" => "subjects#top"
  get "homes/about" => "homes#about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resources :users, only: [:show, :edit,:update]
  #resources :homes, only: [:top, :about]
  resources :subjects, only: [:new, :create, :index, :show, :destroy, :top] do
    resource :favorite, only: [:create, :destroy]#resourceにすると/idがURLに含まれなくなる。
    resources :comments, only: [:create, :show, :destroy]
  end
   #get "/homes/about" => "homes#about", as: "about"
end
