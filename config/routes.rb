Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/done'
  get 'order_items/index'
  get 'products/index'
  get 'products/show'
  root 'users#top'
  devise_for :users
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  resources :users, only:[:show, :edit, :update, :destory]
  resources :admins
  resources :products, only:[:show, :index] do
    resources :carts, only:[:create, :destroy, :update]
  end
 get "/carts" => "carts#index", as:"carts"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users
    resources :products
    resources :artists, only:[:new, :index, :create, :edit, :update, :destroy]
    resources :genres, only:[:new, :index, :create, :edit, :update, :destroy]
    resources :labels, only:[:new, :index, :create, :edit, :update, :destroy]
    resources :arrivals, only:[:new, :create]
  end
end
