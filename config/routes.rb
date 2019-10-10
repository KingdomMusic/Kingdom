Rails.application.routes.draw do
  namespace :admin do
    get 'reviews/new'
    get 'reviews/edit'
    get 'reviews/_index'
  end
  get 'orders/index'
  get 'order_items/index'
  get 'products/index'
  get 'products/show'
  get "/carts" => "carts#index", as:"carts"
  get "/orders/final" => "order_items#final", as:"order_final"
  get 'orders/done' => "orders#done", as:"order_done"
  patch "/carts/:id/change" => "carts#change", as:"cart_change"
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
  resources :order_items, only:[:index, :create]
  resources :destinations, only:[:create, :update]
  resources :reviews
  resources :orders, only:[:create, :index]

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
