Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about"

  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]#単数にすると、そのコントローラのidがリクエストに含まれなくなる。showページがなくidの受け渡しも必要ないため、resourceとしている。
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create, :index, :show, :edit, :destroy, :update]

end
