Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  root 'users#top'
  devise_for :users
  devise_for :admins
  resources :users, only:[:show, :edit, :update, :destroy]
  resources :products, only:[:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :artists, only:[:new, :index, :create, :edit, :update, :destroy]
    resources :genres, only:[:new, :index, :create, :edit, :update, :destroy]
    resources :labels, only:[:new, :index, :create, :edit, :update, :destroy]
    resources :arrivals, only:[:new, :create]
  end
end
