Rails.application.routes.draw do
  namespace :site do
    get 'home/index'
  end
  namespace :users_backoffice do
    get 'home/index'
  end
  namespace :admins_backoffice do
    get 'home/index'
  end
  devise_for :admins
  devise_for :users
  root to: 'site/home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
