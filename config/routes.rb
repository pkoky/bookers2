Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about"
  get "follows/:id" => "relationships#follows", as: "follows"
  get "followers/:id" => "relationships#followers", as: "followers"
  get "search" => "searches#search"
  
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]#単数にすると、そのコントローラのidがリクエストに含まれなくなる。showページがなくidの受け渡しも必要ないため、resourceとしている。
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :relationships, only: [:create, :destroy]

end
