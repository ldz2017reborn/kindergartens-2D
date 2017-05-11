Rails.application.routes.draw do
  devise_for :users

  resources :kindergartens
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
