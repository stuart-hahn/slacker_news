Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :links
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "link#index"
end
