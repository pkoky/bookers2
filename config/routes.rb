Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:new, :create, :index, :show, :edit, :destroy]

end
