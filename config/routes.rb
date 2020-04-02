Rails.application.routes.draw do
  # get 'users/show' =>重複を避けるために削除
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post_images#index'
  resources :post_images, only: [:new, :create, :index, :show]

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  #'resource'=> idの受け渡し不要, 'resources' =>idの受け渡し必要
end
