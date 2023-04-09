Rails.application.routes.draw do
   # get 'homes/top'
  root to: "homes#top"
  get "homes/about" =>"homes#about",as: "about"
  
  devise_for :users
  
 
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  # get 'users/show'
  # get 'users/edit'
  resources :users, only: [:show, :edit, :update]
end
