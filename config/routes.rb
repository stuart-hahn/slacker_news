Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :categories
  resources :comments
  resources :links

  root "links#index"
end
