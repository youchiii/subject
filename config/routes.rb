Rails.application.routes.draw do
  #get 'homes/top'
  devise_for :users
  get "subjects/top" => "subjects#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resources :subjects, only: [:new, :create, :index, :show, :destroy, :top]
   #get "/homes/about" => "homes#about", as: "about"
end
