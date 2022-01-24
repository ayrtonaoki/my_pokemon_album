Rails.application.routes.draw do
  namespace :users_backoffice do
    get 'home/index'
  end
  namespace :admins_backoffice do
    get 'home/index'
  end
  devise_for :admins
  devise_for :users
  root to: 'home#index'
  
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
