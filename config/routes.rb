Rails.application.routes.draw do
  root 'users#top'
  devise_for :users
  devise_for :admins
  resources :users, only:[:show, :edit, :update, :destory]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :artists, only:[:new, :index, :create, :edit, :update, :destroy]
    resources :genres, only:[:new, :index, :create, :edit, :update, :destroy]
    resources :labels, only:[:new, :index, :create, :edit, :update, :destroy]
    get 'arrivals/new'
  end
end
