Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "subjects#top"
  #resources :subjects only: [:new, :create, :index, :show, :destroy, :edit, :update]
  post 'lists' => 'lists#create'
end
