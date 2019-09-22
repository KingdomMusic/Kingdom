Rails.application.routes.draw do
  root 'users#top'
  devise_for :users
  devise_for :admins
  resources :users, only:[:show, :edit, :update, :destory]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users
    resources :products
    resources :artists
    resources :genres
    resources :labels
  end
end
