Rails.application.routes.draw do
  resources :comments
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :links
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "links#index"
end
