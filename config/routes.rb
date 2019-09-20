Rails.application.routes.draw do
  root 'users#top'
  devise_for :users
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  resources :users, only:[:show, :edit, :update, :destory]
  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :artists
    resources :genres
    resources :labels
  end
end
