Rails.application.routes.draw do
  devise_for :users

  resources :kindergartens do
    resources :posts
  end
  root 'kindergartens#index'

  namespace :admin do
    resources :kindergartens do
      member do
       post :publish
       post :hide
      end
    end
  end
end
